class Api::Posts::ApplicationController < Api::ApplicationController
  helper_method :resource_post

  def resource_post
    @post = Post.find(params[:post_id])
  end
end
