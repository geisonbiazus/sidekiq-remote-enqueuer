require 'rspec'
require 'fakeredis'
require 'pry'

require "./lib/sidekiq_remote_enqueuer"

redis_opts = { :driver => Redis::Connection::Memory }

Sidekiq.configure_client do |config|
  config.redis = redis_opts
end

Sidekiq.configure_server do |config|
  config.redis = redis_opts
end

RSpec.configure do |config|
  config.color = true
end
