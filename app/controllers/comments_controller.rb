class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @medium = Medium.find(params[:medium_id])
    @medium.comments.create(comment_params.merge(user: current_user))
    redirect_to medium_path(@medium)
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :rating)
  end

end
