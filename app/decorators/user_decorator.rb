class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{username}"
  end
end
