class PostsController < ApplicationController

  def index
    @posts = Post.includes(:author, likes: :liking_user).page(page).per(per_page)
  end

end
