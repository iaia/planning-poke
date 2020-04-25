class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(
      body: message_params[:body],
      room: current_room
    )
    if @message.new_record?
      ActionCable.server.broadcast 'room_channel',
        content: @message.body
    else
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
