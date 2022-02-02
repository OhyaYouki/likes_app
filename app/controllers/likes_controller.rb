class LikesController < ApplicationController
  before_action :set_like

  def create
    Like.create(user_id:current_user.id,post_id:params[:post_id])
    @like = Like.where(user_id:current_user.id,post_id:params[:post_id])
  end

  def destroy
    @like = Like.where(user_id:current_user.id,post_id:params[:post_id])
    @like.destroy_all
  end

  private

  def set_like
    @post = Post.find(params[:post_id])
  end

end
