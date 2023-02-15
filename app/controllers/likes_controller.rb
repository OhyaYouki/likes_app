class LikesController < ApplicationController
  before_action :set_like,only: [:create,:destroy]

  def create
    # binding.pry
    Like.create(like_params)
    # @like = Like.where(like_params)
    @like = Like.find_by(like_params)
  end

  def destroy
    # binding.pry
    # @like = Like.where(like_params)
    like = Like.find_by(like_params)
    # @like.destroy_all
    like.destroy

    # @like = nil
    # @をつけないようにするといらなくなる
  end


  # 以下users/show/html.erbのあるユーザーがいいねした投稿に対していいねをする、いいねを外した時の挙動
  
  def user_show_create
    # binding.pry
    # ユーザー詳細ページのuser情報
    @user = User.find(params[:user_id])

    # 表示されている投稿の情報
    post = Like.find(params[:id]).post

    # 上記の投稿に対してログイン者がいいねした情報
    Like.create(post_id:post.id,user_id:current_user.id)

    @likes = @user.likes

  end

  def user_show_destroy
    # binding.pry

    # ユーザー詳細ページのuser情報
    @user = User.find(params[:user_id])

    # 表示されている投稿の情報
    post = Like.find(params[:id]).post

    # 上記の投稿に対してログイン者がいいねした情報
    like = Like.find_by(post_id:post.id,user_id:current_user.id)
    like.destroy

    @likes = @user.likes

    @likes = @user.likes
  end

  private

  def like_params
    params.permit(:post_id).merge(user_id:current_user.id)
  end

  def set_like
    @post = Post.find(params[:post_id])
  end

end