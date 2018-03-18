class Rails::Bot::InitializerGenerator < Rails::Generators::Base
	source_root File.expand_path("../../../templates", __FILE__)
  def create_initializer_file
    #create_file "config/initializers/google_initializer.rb", "# Add initialization content here"
    copy_file "google_initializer.rb", "config/initializers/google_initializer.rb"
    copy_file "warden_hooks.rb", "config/initializers/warden_hooks.rb"
  end

  def create_chat_file
  	copy_file "chat.html.erb", "app/views/shared/_chat.html.erb"
  end

  def create_channel_code
  	copy_file "chat_channel.rb", "app/channels/chat_channel.rb"
  	copy_file "chat.coffee", "app/assets/javascripts/channels/chat.coffee"
  	copy_file "ruby_bot_job.rb", "app/jobs/ruby_bot_job.rb"
  end
end