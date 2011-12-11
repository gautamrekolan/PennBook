class Organization < ActiveRecord::Base
  has_many :affiliations
  has_many :users, :through => :affiliations
end
