# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  post_id    :integer
#  user_id    :integer
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :commenter_id, :post_id
  belongs_to :post
  
  validates :content, :presence => true, :length => { :minimum => 1, :maximum => 500 }
  validates :user_id, :presence => true
  validates :commenter_id, :presence => true
  validates :post_id, :presence => true
end
