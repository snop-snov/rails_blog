class PostsController < ApplicationController

  #http_basic_authenticate_with name: configus.basic_auth.name, password: configus.basic_auth.password, except: [:index, :show]
  before_action :require_owner_login, only: [:new, :create, :edit, :updete, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.mark_as_deleted

    redirect_to posts_path
  end

  private
    def require_owner_login
      #unless owner_logged_in?
      #  flash[:error] = "You must be logged in to access this section"
      #  redirect_to new_users # halts request cycle
      #end
    end

    def post_params
      params.require(:post).permit(:title, :text, :state_event, :activity_state_event)
    end
end