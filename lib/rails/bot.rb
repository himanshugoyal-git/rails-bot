module Rails
  module Bot
  	require 'google_custom_search_api'

    require "rails/bot/railtie" if defined?(Rails)

  	#AIzaSyB8_ZgkEqRWz6Rgir7nYKQrvmYRzHkOjbk
    def self.conversation message
    	"Hey Just received your message: " +  message
    end

    def self.search message
      data = {}
      data["type_of_message"] = "search" 
      data["query"] = message
      data["products"] = []   
	results = GoogleCustomSearchApi.search(message)
        results["items"].first(5).each{|item|
  	every_data = {}
        every_data["link"] =  item["link"]
        every_data["body"] = item["htmlSnippet"].first(50)
        every_data["image"] = item["pagemap"]["cse_image"].first["src"]
        data["products"] << every_data       
      }
      data
    end
  end
end
