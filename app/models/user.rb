class User < ActiveRecord::Base
  has_secrure_password validations: false
  has_many :reviews
end
