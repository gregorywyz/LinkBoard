class CommentsController < ApplicationController

  before_action :is_authenticated?

  def index
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.posts.comments.create(commment_params)
    # redirect_to @comment
  end

  private

  def commment_params
    params.require(:comment).permit(:body)
  end

end