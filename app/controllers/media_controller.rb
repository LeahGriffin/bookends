class MediaController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def destroy
    @medium = Medium.find_by_id(params[:id])
    return render_not_found if @medium.blank?
    @medium.destroy
    redirect_to root_path
  end

  def update
    @medium = Medium.find_by_id(params[:id])
    return render_not_found if @medium.blank?

    @medium.update_attributes(medium_params)

    if @medium.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end
  
  def new
    @medium =Medium.new
  end

  def index
    @media = Medium.all
  end 

  def show
    @medium = Medium.find_by_id(params[:id])
    return render_not_found if @medium.blank?
  end

  def edit
    @medium = Medium.find_by_id(params[:id])
    return render_not_found if @medium.blank?
  end


  def create
    @medium = current_user.media.create(medium_params)
    if @medium.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
 

  private

  def medium_params
    params.require(:medium).permit(:genre, :publisher, :title, :author, :description)
  end

  def render_not_found
    render plain: 'Not properly shelved :(', status: :not_found
  end
end
