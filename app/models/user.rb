class User < ActiveRecord::Base
  
  # Ensure related posts are destroyed with the user
  has_many :posts, :dependent => :destroy
end
