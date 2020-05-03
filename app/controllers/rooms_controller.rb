class RoomsController < ApplicationController
  before_action :current_room, :set_room, except: %i[index new create]

  def index
    @current_room = Room.find_by(id: join_room_params[:id])&.authenticate(join_room_params[:password])
    if @current_room
      set_room
      redirect_to room_path(current_room.id)
    else
      redirect_to action: :new
    end
  end

  def new; end

  def create
    @current_room = Room.create!(room_params)
    set_room
    if current_room
      redirect_to room_path(current_room.id)
    else
      redirect_to action: :new
    end
  end

  def show
    @issues = current_room.issues.order(id: :desc)
  end

  private

  def join_room_params
    params.require(:room).permit(:id, :password)
  end

  def room_params
    params.require(:room).permit(:name, :password)
  end

  def set_room
    current_user.room = current_room
    current_user.save!
    session[:room_id] = current_room.id
  end
end
