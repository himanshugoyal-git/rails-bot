# Rails::Bot
Building a bot for the chatting functionality in the Rails Application. Write now using GoogleCustomSearchApi for the query part.

## Usage

Rails::Bot.conversation(message)
=> "Hey Just received your message: #{message}"

Rails::Bot.search(message)
=> #This return the results from the google custom search API

Read this, as a part of this gem uses this for query
https://github.com/wiseleyb/google_custom_search_api

## Configure:
You need to configure GOOGLE_SEARCH_CX and GOOGLE_API_KEY to config/initializers/google_cse_api.rb:

  GOOGLE_API_KEY = "..."
  GOOGLE_SEARCH_CX = "..."


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails-bot'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails-bot
```

Then, create the files and initializers code, make sure you have installed "gem 'google_custom_search_api'", "gem 'devise'"

```bash
rails g rails:bot:initializer
```
The above would create files for you

      create  config/initializers/google_initializer.rb => For the google custom seacrh API
      create  config/initalizers/warden_hooks.rb => For Validation at Websocket Connection
      create  app/views/shared/_chat.html.erb => For rendering the view for chat
      create  app/channels/chat_channel.rb => For communicating with the client
      create  app/assets/javascripts/channels/chat.coffee => For communicating with the server
      create  app/jobs/ruby_bot_job.rb => Bot Responds via this Active Job
      create  config/initalizers/warden_hooks.rb => For Validation at Websocket Connection 

In your application.html.erb, in body add this

```ruby
  <%= render "shared/chat"%>
```

Post that add these methods to your ApplicationHelper(application_helper.rb)
```ruby
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
```
  
  Post that add this to your connection.rb
```ruby  
  identified_by :current_user
 
    def connect
      self.current_user = find_verified_user
    end
     
    private
      def find_verified_user
        if current_user = User.find_by(id: cookies.signed['user.id']) 
          current_user
        else
          reject_unauthorized_connection
        end
      end
```



## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
