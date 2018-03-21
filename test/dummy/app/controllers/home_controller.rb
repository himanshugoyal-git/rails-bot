class HomeController < ApplicationController
  def index

  end

  def broadcast_message
  data = Rails::Bot.search(params[:search])
  ActionCable.server.broadcast("chat_Best_Room",data)
  end
end
