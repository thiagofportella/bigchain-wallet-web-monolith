# rubocop:disable Style/GlobalVars
if Rails.env.test?
  require 'mock_redis'
  $redis = MockRedis.new
else
  $redis = Redis.new(host: Rails.application.credentials.redis_host, port: 6379, reconnect_attempts: 5)
end

$rollout = Rollout.new($redis)
# rubocop:enable Style/GlobalVars
