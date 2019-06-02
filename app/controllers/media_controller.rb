class MediaController < ApplicationController

  def new
    @medium =Medium.new
  end

  def index
    @media = Medium.all
  end 

  def create
     Medium.create(medium_params)
     redirect_to root_path
   end 

  private

  def medium_params
    params.require(:medium).permit(:genre, :publisher, :title, :author, :description)
  end
end
