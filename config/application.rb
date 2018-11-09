require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_mailer.default_url_options = { host: "localhost:4000" }
    config.action_mailer.asset_host = "http://localhost:4000"
    config.action_mailer.delivery_method = :postmark
    config.action_mailer.postmark_settings = { :api_token => "POSTMARK-SERVER-API-TOKEN-HERE" }
  end
end
