class User < ActiveRecord::Base
  has_secure_password
  has_many :puppies
  enum role: [ :customer, :store_owner ]
end
