class RoomsController < ApplicationController
  def show
    @messages = Message.where(room_id: params[:id]).last(100)
    # メッセージ投稿に利用
    @message = current_user.messages.build
    @room = Room.find(params[:id])
  end

  def show_additionally
    last_id = params[:oldest_message_id].to_i - 1
    # @messages = Message.includes(:user).order(:id).where(id: 1..last_id).last(50)
    @messages = Message.where(room_id: params[:id]).where(id: 1..last_id).last(50)
  end
end
