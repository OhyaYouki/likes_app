class LikesController < ApplicationController

  def create
    # binding.pry
    @post = Post.find(params[:post_id])

    if @post.likes.present? && current_user.likes.present?
      like = Like.where(user_id:current_user.id,post_id:params[:post_id])
      # binding.pry
      # destroyだとエラーになる
      like.destroy_all
      redirect_to post_path(@post.id)
    else
      Like.create(user_id:current_user.id,post_id:params[:post_id])
      redirect_to post_path(@post.id)
    end

  end

end
