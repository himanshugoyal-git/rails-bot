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

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
