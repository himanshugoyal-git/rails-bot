$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails/bot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails-bot"
  s.version     = Rails::Bot::VERSION
  s.authors     = ["Himanshu"]
  s.email       = ["erhimanshugoyal@gmail.com"]
  s.homepage    = ""
  s.summary     = "Rails Community needs a Bot"
  s.description = "It creates a bot for you "
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end
