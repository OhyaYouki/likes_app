class PostsController < ApplicationController
  before_action :authenticate_user!,only: :index

  def index
    @posts = Post.all.order(id:"DESC")
    @post = Post.new
  end

  #def new
  #end

  def create
    @post = Post.new(params_content)
    @post.save
    render json:{post: @post}
    
    # エラー文を出したかった
    # binding.pry
    # if @post.save
    #   # binding.pry
    # else
    #   # binding.pry
    #   @posts = Post.all.order(id:"DESC")
    #   render :index
    # end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def params_content
    params.require(:post).permit(:content).merge(user_id:current_user.id)
  end
end
