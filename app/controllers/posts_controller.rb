class PostsController < ApplicationController

  def new
    require_owner_login
    @post = Post.new
  end

  def create
    require_owner_login
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
    require_owner_login
    @post = Post.find(params[:id])
  end

  def update
    require_owner_login
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    require_owner_login
    @post = Post.find(params[:id])
    @post.mark_as_deleted

    redirect_to posts_path
  end

  private
    def require_owner_login
      unless owner_logged_in?
        flash[:error] = "You must be owner to access this section"
        redirect_to posts_path
      end
    end

    def post_params
      params.require(:post).permit(:title, :text, :state_event, :activity_state_event)
    end
end