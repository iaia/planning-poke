class RoomsController < ApplicationController

  def create
    Room.create(room_params)
  end

  def show
  end

  def room_params
    params.require(:room).permit(:name, :password)
  end
end
