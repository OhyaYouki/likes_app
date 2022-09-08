class LikesController < ApplicationController
  before_action :set_like

  def create
    # binding.pry
    Like.create(like_params)
    # @like = Like.where(like_params)
    @like = Like.find_by(like_params)
  end

  def destroy
    # binding.pry
    # @like = Like.where(like_params)
    @like = Like.find_by(like_params)
    # @like.destroy_all
    @like.destroy
    @like = nil
  end

  private

  def like_params
    params.permit(:post_id).merge(user_id:current_user.id)
  end

  def set_like
    @post = Post.find(params[:post_id])
  end

end