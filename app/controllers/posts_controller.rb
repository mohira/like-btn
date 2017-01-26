class PostsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all # ここでアソシエーションが生きる
    end
  end

  def show
  end
end
