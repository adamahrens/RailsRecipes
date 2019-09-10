class ChatroomController < ApplicationController
  def show
    @message = Message.new
    @messages = Message.latest_messages
  end
end
