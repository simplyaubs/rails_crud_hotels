class HotelsController < ApplicationController

  def index
    @hotel = Hotel.new
    @hotels = Hotel.all
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save

      redirect_to hotels_path
    else
      render :index
    end
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    @hotel.update_attributes!(hotel_params)

    redirect_to hotels_path
  end

  def destroy
    @hotel = Hotel.find(params[:id]).delete

    redirect_to hotels_path 
  end

  private
  def hotel_params
    params.require(:hotel).permit(:name, :rating)
  end
end