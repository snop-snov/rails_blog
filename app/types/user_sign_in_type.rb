class UserSignInType
  include BaseTypeWithoutActiveRecord

  attribute :username, String
  attribute :password, String

  validates :username, presence: true
  validates :password, presence: true

  validate :check_authenticate, if: :username

  def user
    @user = User.where(username: username).first!
  end

  private

  def check_authenticate
    if !(user.try(:password) == password)
      errors.add(:password, :user_or_password_invalid)
    end
  end
end
