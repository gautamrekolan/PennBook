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
end
