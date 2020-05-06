class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    ActionCable.server.broadcast "room_channel_#{params[:room_id]}", message: data['message']
  end

  class << self
    def send_estimates(room_id, current_issue)
      body = current_issue.estimates.map do |m|
        "#{m.user.name}: #{m.point}\n"
      end
      ActionCable.server.broadcast(
        "room_channel_#{room_id}",
        message: body
      )
    end

    def notify_new_issue(room_id)
      ActionCable.server.broadcast(
        "room_channel_#{room_id}",
        notify: 'new-issue'
      )
    end
  end
end
