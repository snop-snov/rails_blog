class UserMailer < ApplicationMailer
  def greet_email(user)
    @user = user
    mail(to: @user.email)
  end
end
