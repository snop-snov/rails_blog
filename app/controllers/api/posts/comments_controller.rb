class Api::Posts::CommentsController < Api::Posts::ApplicationController
  def create
    @comment = CommentEditType.new params[:post_comment]
    @comment.post = resource_post
    @comment.user = current_user
    @comment.save
    respond_with @comment, location: nil
  end
end
