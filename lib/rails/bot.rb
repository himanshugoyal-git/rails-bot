module Rails
  module Bot
  	require 'google_custom_search_api'
  	#AIzaSyB8_ZgkEqRWz6Rgir7nYKQrvmYRzHkOjbk
    def self.conversation message
    	"Hey Just received your message: " +  message
    end

    def self.search message
    	GoogleCustomSearchApi.search(message)
    end
  end
end
