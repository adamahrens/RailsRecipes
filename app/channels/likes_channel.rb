class LikesChannel < ApplicationCable::Channel
  def subscribed
    logger.debug 'LikesChannel#subscribed'
    stream_from 'likes'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.debug 'LikesChannel#unsubscribed'
  end
end
