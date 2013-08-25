class Web::Posts::ApplicationController < Web::ApplicationController
  helper_method :resource_post

  def resource_post
    @post = Post.where(id: params[:post_id]).first!
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
