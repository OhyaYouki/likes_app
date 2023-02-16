class LikesController < ApplicationController
  before_action :set_like, only: [:create,:destroy]
  before_action :set_user_post, only: [:user_show_create,:user_show_destroy]

  def create
    Like.create(like_params)
    @like = Like.find_by(like_params)
  end

  def destroy
    like = Like.find_by(like_params)
    like.destroy
  end

  # 以下users/show/html.erbのあるユーザーがいいねした投稿に対していいねをする、いいねを外した時の挙動
  
  def user_show_create
    # 投稿に対してログイン者がいいねした情報
    Like.create(post_id: @post.id,user_id: current_user.id)

    @likes = @user.likes
  end

  def user_show_destroy
    # 投稿に対してログイン者がいいねした情報
    like = Like.find_by(post_id: @post.id,user_id: current_user.id)
    like.destroy

    @likes = @user.likes
  end

  private

  def like_params
    params.permit(:post_id).merge(user_id: current_user.id)
  end

  def set_like
    @post = Post.find(params[:post_id])
  end

  def set_user_post
    # ユーザー詳細ページのuser情報
    @user = User.find(params[:user_id])

    # 表示されている投稿の情報
    @post = Like.find(params[:id]).post
  end

end