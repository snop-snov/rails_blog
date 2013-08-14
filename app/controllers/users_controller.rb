class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = UserRegistrationType.new params[:user]
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end
end
