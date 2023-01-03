Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL')
  }
end

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL')
  }
  config.logger.level = Logger.const_get(ENV.fetch('LOG_LEVEL', 'info').upcase.to_s)
end
