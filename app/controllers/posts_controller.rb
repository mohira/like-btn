class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all # ここでアソシエーションが生きる
    end
  end

  def show
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

  def edit
    if !current_user.is_author?(@post)
      flash[:notice] = '編集権限がありません'
      redirect_to post_path(@post)
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
