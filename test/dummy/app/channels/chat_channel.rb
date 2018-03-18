class ChatChannel < ApplicationCable::Channel
# Called when the consumer has successfully
  # become a subscriber of this channel.

  def subscribed
  	stream_from "chat_#{params[:room]}"
  end

  def receive(data)
  	data["time"] = Time.now.strftime("at %I:%M%p")
    ActionCable.server.broadcast("chat_#{params[:room]}", data)
    RubyBotJob.perform_later data,params[:room]
  end


end