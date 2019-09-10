class MessagesController < ApplicationController
  before_action :require_authenticated_user

  def create

  end

  private

  def comment_params
    params.require(:message).permit(:content)
  end
end
