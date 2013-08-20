class Web::PostsController < Web::ApplicationController
  before_action :require_owner_login, only: [:new, :create, :edit, :updete, :destroy]
  add_breadcrumb :index, :posts_path

  def new
    @post = Post.new
    add_breadcrumb :new, :new_post_path
  end

  def create
    @post = PostEditType.new(params[:post])
    if @post.save
      f(:success)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.published
  end

  def show
    @post = Post.find(params[:id])
    @comment = Post::Comment.new(:parent_id => params[:parent_id])
    add_breadcrumb :show, @post
  end

  def edit
    @post = Post.find(params[:id])
    add_breadcrumb :edit, :edit_post_path
  end

  def update
    @post = Post.find(params[:id])
    @post = @post.becomes(PostEditType)

    if @post.update(params[:post])
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
    unless owner_logged_in?
      f(:error)
      redirect_to posts_path
    end
  end
end
