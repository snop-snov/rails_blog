class UserSignInType
  include BaseTypeWithoutActiveRecord

  attribute :email, String
  attribute :password, String

  validates :email, presence: true, email: true
  validates :password, presence: true

  validate :check_authenticate, if: :email

  def user
    @user = User.where(email: email.mb_chars.downcase).first!
  end

  private

  def check_authenticate
    if !(user.try(:password) == password)
      errors.add(:password, :user_or_password_invalid)
    end
  end
end
