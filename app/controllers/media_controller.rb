class MediaController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def destroy
    @medium = Medium.find_by_id(params[:id])
    return render_not_found if @medium.blank?
    return render_not_found(:forbidden) if @medium.user != current_user   
    @medium.destroy
    redirect_to root_path
  end

  def update
    @medium = Medium.find_by_id(params[:id])
    return render_not_found if @medium.blank?
    return render_not_found(:forbidden) if @medium.user != current_user
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
    @comment = Comment.new
    return render_not_found if @medium.blank?
  end

  def edit
    @medium = Medium.find_by_id(params[:id])
    return render_not_found if @medium.blank?
    return render_not_found(:forbidden) if @medium.user != current_user
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

  def render_not_found(status=:not_found)
    render plain: "#{status.to_s.titleize} :(", status: status
  end
end
