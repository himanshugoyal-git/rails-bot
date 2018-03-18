class RubyBotJob < ApplicationJob
	queue_as :default
	
  def perform(data,room_id)
  	 	data["body"] = Rails::Bot.conversation(data["body"])
      data["sent_by"] = "Bot"
      data["time"] = Time.now.strftime("at %I:%M%p")
      ActionCable.server.broadcast("chat_#{room_id}", data)
  end
end