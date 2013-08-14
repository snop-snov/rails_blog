class UserRegistrationType < User
  include BaseType

  permit :username, :password

  validates :username, uniqueness: true,
                         presence: true
  validates :password, presence: true
end
