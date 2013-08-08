class SessionsController < ApplicationController
  def new
    @session = UserSignInType.new
  end

  def create
    @session = UserSignInType.new(params[:user_sign_in_type])
    if @session.valid?
      sign_in @session.user
      redirect_to posts_path
    else
      #redirect_to new_session_path
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to posts_path
  end
end