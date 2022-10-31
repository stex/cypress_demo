class PostsController < ApplicationController
  before_action :authenticate, except: :index

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new(account: current_account)
  end

  def create
    @post = current_account.posts.create(permitted_attributes)

    if @post.new_record?
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = current_account.posts.find(params[:id])
  end

  def update
    @post = current_account.posts.find(params[:id])

    if @post.update(permitted_attributes)
      render partial: "post", object: @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def permitted_attributes
    params.require(:post).permit(:title, :content)
  end
end
