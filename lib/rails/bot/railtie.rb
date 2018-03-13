class Rails::Bot::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/rails_bot.rake'
  end
end
