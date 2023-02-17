class LikesController < ApplicationController
  before_action :set_like, only: [:create,:destroy]
  before_action :set_user, only: [:user_show_create,:user_show_destroy]
  before_action :set_post, only: [:user_show_create,:user_show_destroy]

  # 以下一覧ページ、投稿詳細ページ、ユーザー詳細ページの投稿一覧のいいねした時に動くアクション

  def create
    Like.create(like_params)
    @like = Like.find_by(like_params)

    # 上をまとめて、@like =Like.create(like_params) でもいい？
  end

  def destroy
    like = Like.find_by(like_params)
    # like = Like.find(params[:id])でもいい？

    like.destroy
  end

  # 以下users/show/html.erbのあるユーザーがいいねした投稿に対していいねをする、いいねを外した時の挙動
  
  def user_show_create
    # 投稿に対してログイン者がいいねする情報の保存
    Like.create(post_id: @post.id,user_id: current_user.id)

    # 再定義
    @likes = @user.likes
  end

  def user_show_destroy
    # 投稿に対してログイン者がいいねした情報
    like = Like.find_by(post_id: @post.id,user_id: current_user.id)
    like.destroy

    # 再定義
    @likes = @user.likes
  end

  private

  def like_params
    # 「誰が」「どの投稿に」いいねするか
    params.permit(:post_id).merge(user_id: current_user.id)
  end

  def set_like
    # 投稿詳細ページの表示に必要
    @post = Post.find(params[:post_id])
  end

  def set_user
    # ユーザー詳細ページのuser情報
    @user = User.find(params[:user_id])
  end

  def set_post
    # 表示されている投稿の情報
    @post = Like.find(params[:id]).post
  end

end