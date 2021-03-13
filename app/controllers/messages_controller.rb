class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create!(message_params)
    # 投稿されたメッセージをチャット参加者に配信
    ActionCable.server.broadcast 'room_channel', message: @message.template
    # ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message)
  end

  private
  def message_params
    params.require(:message).permit(:content, :room_id)
  end
end
