class User < ActiveRecord::Base
  has_many :spiders
  has_secure_password
end
