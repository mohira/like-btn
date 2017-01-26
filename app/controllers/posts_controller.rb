class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all # ここでアソシエーションが生きる
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new()
  end
end
