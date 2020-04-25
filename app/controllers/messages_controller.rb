class MessagesController < ApplicationController
  def new; end

  def create
    @message = current_user.messages.create!(
      body: message_params[:body],
      room: current_room
    )
    ActionCable.server.broadcast(
      'room_channel',
      content: @message.body
    )
  end

  private

  def current_room
    @current_room ||= Room.find_by(id: session[:room_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
