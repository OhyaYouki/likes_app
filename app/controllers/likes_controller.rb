class LikesController < ApplicationController

  def create
    # binding.pry
    @post = Post.find(params[:post_id])
    Like.create(user_id:current_user.id,post_id:params[:post_id])
    @like = Like.where(user_id:current_user.id,post_id:params[:post_id])
    # redirect_to post_path(@post.id)
    # render json:{post: post}
  end

  def destroy
    # binding.pry
    @post = Post.find(params[:post_id])
    @like = Like.where(user_id:current_user.id,post_id:params[:post_id])
    @like.destroy_all
    # redirect_to post_path(@post.id)
  end

end
