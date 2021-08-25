if Rails.env == 'production'
  Sidekiq.configure_server do |config|
    config.server_middleware do |chain|
      chain.add Kiqstand::Middleware
    end
    config.redis = { :url => REDIS_URL, :password => REDIS_PASSWORD, :namespace => 'query_processor', :network_timeout => 5 }
  end

  Sidekiq.configure_client do |config|
    config.redis = {:url => REDIS_URL, :password => REDIS_PASSWORD, :namespace => 'query_processor', :network_timeout => 5 }
  end
elsif Rails.env == 'staging'
  Sidekiq.configure_server do |config|
    config.options[:queues] = %w(default)
    config.redis = {:url => REDIS_URL, :password => REDIS_PASSWORD, :namespace => 'query_processor' }
  end
  Sidekiq.configure_client do |config|
    config.redis = {:url => REDIS_URL, :password => REDIS_PASSWORD, :namespace => 'query_processor' }
  end
elsif Rails.env == 'development'
  # start all queues in development & give namespace
  Sidekiq.configure_server do |config|
    config.options[:queues] = %w(default)
    config.redis = {:namespace => 'query_processor' }
  end
  Sidekiq.configure_client do |config|
    config.redis = {:namespace => 'query_processor' }
  end
end
