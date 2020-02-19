class PingChannel < ApplicationCable::Channel
  def subscribed
    Rails.logger.debug { "PingChannel subscribed" }
    stream_from "mefkit_ping_channel"
  end

  def unsubscribed
    Rails.logger.debug { "PingChannel unsubscribed" }
    # Any cleanup needed when channel is unsubscribed
  end

  def pong(msg)
    Rails.logger.info { ">>>>>> PingChannel pong: #{msg}" }
  end

  class << self
  end
end
