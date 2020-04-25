class RoomsController < ApplicationController
  before_action :set_room, only: :show

  def new; end

  def create
    Room.create(room_params)
  end

  def show
    session[:room_id] = @room.id
  end

  private

  def room_params
    params.require(:room).permit(:name, :password)
  end

  def set_room
    p params[:id]
    @room = Room.find(params[:id])
    if @room && @room&.authenticate(params[:password])
    else
      redirect_to action: :new
    end
  end
end
