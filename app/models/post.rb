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
end
