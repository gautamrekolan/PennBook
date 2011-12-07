# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  belongs_to :user

  validates :content, :presence => true, :length => { :minimum => 1, :maximum => 500 }
  validates :user_id, :presence => true

  default_scope :order => 'posts.created_at DESC'

  # Return microposts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

    # Return an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      following_ids = %(SELECT followed_id FROM relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids}) OR user_id = :user_id",
            { :user_id => user })
    end
end
