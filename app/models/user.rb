class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true, email: true
  validates :username, uniqueness: true, presence: true

  has_many :comments
end
