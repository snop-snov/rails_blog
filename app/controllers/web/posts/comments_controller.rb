class Web::Posts::CommentsController < Web::Posts::ApplicationController
  before_action :require_sign_in

  def create
    @post = resource_post

    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
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

#TODO сделать через типы
  def comment_params
    c_params = params.require(:post_comment).permit(:body, :parent_id)
    c_params[:user_id] = current_user.id
    c_params
  end
end
