class Business < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates_presence_of :name, :description
end
