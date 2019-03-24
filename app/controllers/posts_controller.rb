class PostsController < ApplicationController
	before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post added!'
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.includes(:comments).find_by(id: params[:id])
    # @comments = @post.comments
    @comment = Comment.new
  end
  
  private

  def post_params
    params.require(:post).permit(:title)
  end

  def timestamp
	  created_at.strftime('%H:%M:%S %d %B %Y')
	end
end