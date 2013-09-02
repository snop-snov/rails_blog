class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{username} (#{email})"
  end
end
