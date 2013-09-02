class UserRegistrationType < User
  include BaseType

  validates :password, presence: true
  permit :email, :username, :password

  def email=(email)
    write_attribute(:email, email.mb_chars.downcase)
  end
end
