class SiteController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :desc)
    @vote = Vote.new
    # # need new route for homepage (can't go off localhost:3000)
    # respond_to do |format|
    #   format.json{ render json: @posts}
    #   format.html
    # end
  end

end