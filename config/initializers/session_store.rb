Rails.application.config.session_store :redis_session_store, {
  key: "_rails_redis_session_demo_app",
  redis: {
    expire_after: 120.minutes,  # cookie expiration
    ttl: 120.minutes,           # Redis expiration, defaults to 'expire_after'
    key_prefix: 'rails_session_demo:session:',
    url: 'redis://localhost:6379/0'
  }
}
