class RoomsController < ApplicationController
  before_action :set_room, only: :show
  helper_method :current_room

  def new; end

  def create
    @room = Room.create!(room_params)
    if @room
      redirect_to room_path(@room.id, params: { password: @room.password })
    end
  end

  def show
    session[:room_id] = current_room.id
  end

  private

  def room_params
    params.require(:room).permit(:name, :password)
  end

  def set_room
    @room = Room.find_by(id: params[:id])
    if @room && @room&.authenticate(params[:password])
    else
      redirect_to action: :new
    end
  end

  def current_room
    @current_room ||= @room
  end
end
