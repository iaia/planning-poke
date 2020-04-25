class MessagesController < ApplicationController
  def create
    current_user.messages.create(
      body: message_params[:body],
      room: current_room
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
