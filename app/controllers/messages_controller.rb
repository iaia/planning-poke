class MessagesController < ApplicationController
  def new; end

  def create
    @message = current_user.messages.create!(
      body: message_params[:body],
      room: current_room
    )
    if current_room.messages.pluck(:user_id).size == current_room.user_count
      body = current_room.messages.map do |m|
        "#{m.user.name}: #{m.body}\n"
      end
      ActionCable.server.broadcast(
        'room_channel',
        message: body
      )
      # FIXME: 残るようにしたい
      current_room.messages.destroy_all
    end
  end

  private

  def current_room
    @current_room ||= Room.find_by(id: session[:room_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
