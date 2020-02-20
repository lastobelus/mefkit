class PingChannel < ApplicationCable::Channel
  STREAM = "mefkit_ping_channel"

  def subscribed
    Rails.logger.debug { "PingChannel subscribed" }
    stream_from STREAM
    ensure_confirmation_sent
    transmit(
      ping: {
        msg: "subscribed",
      },
    )
  end

  def unsubscribed
    Rails.logger.debug { "PingChannel unsubscribed" }
    # Any cleanup needed when channel is unsubscribed
  end

  def pong(data)
    Rails.logger.info { ">>>>>> PingChannel pong: #{data}" }
    transmit(
      ping: {
        msg: "ACK: #{data["msg"]}",
      },
    )
  end

  class << self
    def ping(msg)
      ActionCable.server.broadcast(
        STREAM,
        ping: {
          msg: msg,
        },
      )
    end
  end
end
