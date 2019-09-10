class MessagesController < ApplicationController
  before_action :require_authenticated_user

  def create
    @message = Message.new(message_params)
    @message.chef = current_chef
    if @message.save
    else
      flash[:danger] = 'Message was not created'
      redirect_to :back
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
