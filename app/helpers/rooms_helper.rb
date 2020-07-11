module RoomsHelper
  def sharing_link(room)
    room_url(room, params: { uuid: room.uuid })
  end
end
