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

  private
  def hotel_params
    params.require(:hotel).permit(:name, :rating)
  end
end