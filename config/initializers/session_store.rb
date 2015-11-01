# Be sure to restart your server when you modify this file.

# config/initializers/session_store.rb
#MyApplication::Application.config.session_store :redis_store, servers: 'redis://localhost:6379/0/cache'

Rails.application.config.session_store :cookie_store, key: '_nameofapp_session'

