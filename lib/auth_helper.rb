module AuthHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    !session[:user_id].nil?
  end

  def authenticate_user!
    unless signed_in?
      redirect_to new_session_path
    end
  end

  def owner_logged_in?
    if signed_in?
      true if current_user[:username] == configus.owner.username
    end
  end

  def current_user
    User.where(id: session[:user_id]).first!
  end
end