class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])

    @like = Like.new(
      post_id: params[:post_id],
      user_id: current_user.id
    )

    if @like.save
      redirect_to post_path(@post)
    else
      render template: 'posts/show'
    end
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    redirect_to post_path(params[:post_id])
  end

  private
    def like_params
      params.require(:like).permit(:post_id, :user_id)
    end
end