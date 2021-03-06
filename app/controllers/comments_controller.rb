class CommentsController < ApplicationController
  before_action :require_sign_in

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_to post_path(@post)
    else
      flash[:error] = t('.no_comment_owner')
      redirect_to post_path(@post)
    end
  end

  private
  def require_sign_in
    unless signed_in?
      flash[:error] = t('.nobody_signed_in')
      redirect_to new_session_path
    end
  end

  def comment_params
    c_params = params.require(:comment).permit(:body)
    c_params[:user_id] = current_user.id
    c_params
  end
end