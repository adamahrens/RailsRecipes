class CommentsChannel < ApplicationCable::Channel
  def subscribed
    logger.debug 'CommentsChannel#subscribed'
    stream_from 'comments'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.debug 'CommentsChannel#unsubscribed'
  end
end
