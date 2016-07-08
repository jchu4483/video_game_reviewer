class Author < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email, :name
end
