class MessagesController < ApplicationController
  before_action :require_authenticated_user

  def create
    @chef = Chef.find(params[:chef_id])
    @message = @chef.messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast(
        'messages',
        render(partial: 'chatroom/message', object: @message)
      )
    else
      flash[:danger] = 'Message was not created'
      redirect_to chat_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
