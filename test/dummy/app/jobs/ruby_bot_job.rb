class RubyBotJob < ApplicationJob
	queue_as :default
	
  def perform(data,room_id,to_ignore=nil)
  	search_keywords = %w{scouring rummage foraging forage hunting seeking hunt looking quest exploration frisking frisk activity manhunt shakedown ransacking searching help}
  	 	if (data["body"].split(' ').collect(&:downcase) & search_keywords).blank?
	  	 	data["body"] = Rails::Bot.conversation(data["body"])
	      data["sent_by"] = "Bot"
	      data["time"] = Time.now.strftime("at %I:%M%p")
	      data["type_of_message"] = "bot"
	      ActionCable.server.broadcast("chat_#{room_id}", data)
	     else
	     	ActionCable.server.broadcast("chat_#{room_id}", Rails::Bot.search(data["body"].gsub("Looking for","")))
	     end
  end



end