class Web::UsersController < Web::ApplicationController
  def new
    @user = User.new
    add_breadcrumb :new, :root_path
  end

  def index
    @users = User.all.page(params[:page]).decorate
  end

  def create
    @user = UserRegistrationType.new(params[:user])
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end
end
