class PostsController < ApplicationController
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

  private
  def params_content
    params.require(:post).permit(:content)
  end
end