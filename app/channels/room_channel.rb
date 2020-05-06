class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    ActionCable.server.broadcast 'room_channel', message: data['message']
  end

  class << self
    def send_message(current_issue)
      body = current_issue.estimates.map do |m|
        "#{m.user.name}: #{m.point}\n"
      end
      ActionCable.server.broadcast(
        'room_channel',
        message: body
      )
    end
  end
end
