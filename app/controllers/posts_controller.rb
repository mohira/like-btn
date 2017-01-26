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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: post_params[:title],
      body: post_params[:body],
      user_id: current_user.id
    )

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
