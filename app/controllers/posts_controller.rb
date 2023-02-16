class PostsController < ApplicationController
  
  def index
    @posts = Post.all.order(created_at:"DESC")
    @post = Post.new
  end

  def create
    @post = Post.new(params_content)
    @posts = Post.all.order(created_at:"DESC")
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.find_by(user_id:current_user.id,post_id:@post.id)
  end

  private
  
  def params_content
    params.require(:post).permit(:content).merge(user_id:current_user.id)
  end
end

