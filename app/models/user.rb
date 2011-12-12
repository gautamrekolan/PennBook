# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  birthday   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :first_name, :last_name, :email, :birthday, :password, :password_confirmation

  has_many :posts, :dependent => :destroy
  has_many :likes
  has_many :interests, :through => :likes
  has_many :relationships,  :foreign_key => "follower_id",
                            :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  has_many :affiliations
  has_many :organizations, :through => :affiliations

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name,  :presence => true,
                          :length   => { :maximum => 63 }
  validates :last_name,   :presence => true,
                          :length   => { :maximum => 63 }
  validates :email, :presence => true,
                    :length   => { :maximum => 63 },
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false}
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }
  validates_each :birthday do |record, attr, value|
    begin
      Date.parse(value)
    rescue
      record.errors.add(attr, "Invalid date")
    end
  end

  before_save :encrypt_password

  def name()
    self.first_name + " " + self.last_name
  end

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
    posts.create!(:content => self.name + " is now following " + followed.name)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  def feed
    Post.from_users_followed_by(self)
  end

  def likes?(interest)
    likes.find_by_interest_id(interest)
  end

  def like!(interest)
    likes.create!(:interest_id => interest.id)
    posts.create!(:content => self.name + " likes " + interest.name)
  end

  def unlike!(interest)
    likes.find_by_interest_id(interest).destroy
  end

  def affiliates?(organization)
    affiliations.find_by_organization_id(organization)
  end

  def affiliate!(organization)
    affiliations.create!(:organization_id => organization.id)
    posts.create!(:content => self.name + " joined " + organization.name)
  end

  def unaffiliate!(organization)
    affiliations.find_by_organization_id(organization).destroy
  end


  def self.search(search)
    find(:all, :conditions => ['first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
  end

  def to_json()
    children = []
    data_content = "<h4>#{self.name}</h4><b>Following:</b><ul>"
    
    self.following.each do |user|
      children_deep = []
      data_content_deep = "<h4>#{user.name}</h4><b>Following:</b><ul>"
      user.following.each do |user_deep|
        children_deep << {
          :id => "#{user_deep.id}",
          :name => user_deep.name,
          :children => [],
          :data => {
            :relation => "<h4>#{user_deep.name}</h4>"
          }
        }
        data_content_deep += "<li>#{user_deep.name}</li>".html_safe
      end
      data_content_deep += "</ul>"
      
      children << {
        :id => "#{user.id}",
        :name => user.name,
        :children => children_deep,
        :data => {
          :relation => data_content_deep
        }
      }
      data_content += "<li>#{user.name}</li>".html_safe
    end
    data_content += "</ul>"
    
    { 
      :id => "#{self.id}",
      :name => self.name,
      :children => children,
      :data => {
        :relation => data_content
      }
    }.to_json
  end

  private

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end


end
