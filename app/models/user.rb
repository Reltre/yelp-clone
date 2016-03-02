class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :email, :password
  has_many :reviews
end
