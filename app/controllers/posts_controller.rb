class PostsController < ApplicationController

  def index
    @posts = Post
               .includes(:author, likes: :liking_user)
               .order(created_at: :desc)
               .page(page)
               .per(per_page)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params.require(:post).permit(:title, :body).merge(author: current_user))

    if @post.persisted?
      redirect_to posts_path
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end
end
