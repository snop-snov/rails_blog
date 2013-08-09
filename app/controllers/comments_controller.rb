class CommentsController < ApplicationController

  def create
    require_sign_in
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    require_sign_in
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    c_params = params.require(:comment).permit(:body)
    c_params[:user_id] = current_user.id
    c_params
  end

  def require_sign_in
    unless signed_in?
      flash[:error] = "You must sign in to access this section"
      redirect_to posts_path
    end
  end
end