class LikesController < ApplicationController
  before_action :load_post

  def create
    @post.likes.create(liking_user: current_user)
    redirect_to posts_path
  end

  def destroy
    @post.likes.find_by(liking_user: current_user).destroy
    redirect_to posts_path
  end

  private

  def load_post
    @post ||= Post.find(params[:post_id])
  end
end
