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
  attr_accessible :first_name, :last_name, :email, :birthday
  validates :first_name,  :presence => true,
                          :length   => { :maximum => 63 }
  validates :last_name,   :presence => true,
                          :length   => { :maximum => 63 }

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                    :length   => { :maximum => 63 },
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false}
                    
  validates_each :birthday do |record, attr, value|
    begin
      Date.parse(value)
    rescue
      record.errors.add(attr, "Invalid date")
    end
  end
  
  # Ensure related posts are destroyed with the user
  has_many :posts, :dependent => :destroy
end
