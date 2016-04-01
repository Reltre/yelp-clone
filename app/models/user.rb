class User < ActiveRecord::Base
  has_secure_password validations: false
  validates_presence_of :email, :password
  has_many :reviews

  def full_name
    "#{first_name} #{last_name}"
  end
end
