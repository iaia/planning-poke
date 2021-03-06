class RoomsController < ApplicationController
  before_action :logged_in?, :direct_in, :current_room, :set_room, only: %i[show]

  def index
    @current_room = Room.opening
      .find_by(uuid: join_room_params[:uuid])
      &.authenticate(join_room_params[:password])

    respond_to do |format|
      format.html do
        if @current_room
          set_room
          redirect_to room_path(current_room.id)
        else
          redirect_to action: :new
        end
      end
      format.json { @current_room }
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
    # @issues = current_room.issues.order(id: :desc)
  end

  private

  def join_room_params
    params.require(:room).permit(:uuid, :password)
  end

  def room_params
    params.require(:room).permit(:name, :password)
  end

  def direct_in
    return if current_room
    return unless params[:uuid]
    room = Room.find_by(uuid: params[:uuid])
    if room
      session[:room_id] = room.id
    else
      redirect_to action: :new
    end
  end

  def set_room
    current_user.room = current_room
    current_user.save!
    session[:room_id] = current_room.id
  end
end
