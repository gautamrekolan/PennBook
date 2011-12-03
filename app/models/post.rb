class Post < ActiveRecord::Base
  belongs_to :user
  
  validates :content, :presence => true, :length => { :minimum => 1, :maximum => 500 }
  validates :user_id, :presence => true
end
