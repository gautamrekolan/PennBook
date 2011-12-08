# == Schema Information
#
# Table name: interests
#
#  id          :integer         not null, primary key
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Interest < ActiveRecord::Base
  has_many :likes
  has_many :users, :through => :likes
end
