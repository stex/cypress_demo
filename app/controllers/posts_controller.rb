class PostsController < ApplicationController

  def index
    @posts = Post.page(page).per(per_page)
  end

end
