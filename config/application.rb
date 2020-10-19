require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

ENV['RAILS_ADMIN_THEME'] = 'material'

module HelloBashrail
  class Application < Rails::Application
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get post options]
      end
    end

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.time_zone = 'Eastern Time (US & Canada)'

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(5.2)
  end
end
