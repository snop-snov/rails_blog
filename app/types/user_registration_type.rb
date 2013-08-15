class UserRegistrationType < User
  include BaseType

  permit :username, :password
end
