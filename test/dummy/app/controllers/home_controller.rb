class HomeController < ApplicationController
  def index

  end

  def broadcast_message
  	  	ActionCable.server.broadcast(
  "chat_Best_Room",
  sent_by: 'Paul',
  body: 'This is a cool chat app.',
  time: Time.now.strftime("at %I:%M%p")
)
  end
end
