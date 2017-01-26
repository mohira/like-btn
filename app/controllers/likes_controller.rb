class LikesController < ApplicationController
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

  private
    def like_params
      params.require(:like).permit(:post_id, :user_id)
    end
end