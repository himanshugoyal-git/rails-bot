class Rails::Bot::Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/rails_bot.rake'
  end

  generators do
  	require 'rails/bot/initializer_generator'
  end
end
