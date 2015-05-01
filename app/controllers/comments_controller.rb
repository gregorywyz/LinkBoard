class CommentsController < ApplicationController

  before_action :is_authenticated?, except: [:index]

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order(created_at: :desc)
    @vote = Vote.new
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def create
    @post = Post.find(params[:post_id])
    current_user.comments << @post.comments.create(comment_params)

    flash[:success] = "You added a comment"
    redirect_to posts_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end