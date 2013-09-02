class Web::Posts::CommentsController < Web::Posts::ApplicationController
  before_action :require_sign_in

  def create
    @comment = CommentEditType.new(params[:post_comment])
    @comment.post = resource_post
    @comment.user = current_user
    if @comment.save
      f(:success)
    else
      f(:error)
    end

    redirect_to post_path(resource_post)
  end

  def destroy
    @post = resource_post
    @comment = @post.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      f(:success)
      redirect_to post_path(@post)
    else
      f(:error)
      redirect_to post_path(@post)
    end
  end

  private
  def require_sign_in
    unless signed_in?
      f(:error)
      redirect_to new_session_path
    end
  end

end
