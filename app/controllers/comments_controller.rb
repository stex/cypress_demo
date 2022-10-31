class CommentsController < ApplicationController
  helper_method :post

  def index
    @comments = post.comments
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end
end
