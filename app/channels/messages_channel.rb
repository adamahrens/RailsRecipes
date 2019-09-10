class MessagesChannel < ApplicationCable::Channel
  def subscribed
    logger.debug 'MessagesChannel#subscribed'
    stream_from 'messages'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.debug 'MessagesChannel#unsubscribed'
  end
end
