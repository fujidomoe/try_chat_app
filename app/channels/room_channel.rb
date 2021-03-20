class RoomChannel < ApplicationCable::Channel
  def subscribed
    # 配信する部屋名を決定
    stream_from "room_channel"
    # stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
