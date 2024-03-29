require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Vc2online
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local # Or :utc
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.autoload_paths += %W[#{config.root}/lib/validators/]
    config.autoload_paths += %W(#{config.root}/lib/methods/)
    
    
    config.logger = ActiveSupport::Logger.new(STDOUT)
  end
end
