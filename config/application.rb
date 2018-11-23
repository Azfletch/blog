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

    # Not sure if I need this line as method already set in config/environments/development.rb
    config.action_mailer.delivery_method = :smtp

    # implemented settings based on https://postmarkapp.com/developer/user-guide/sending-email/sending-with-smtp
    config.action_mailer.postmark_settings = {
      address:                "smtp.postmarkapp.com",
      port:                   25,
      user_name:              ENV.fetch("SMTP_USERNAME"),
      password:               ENV.fetch("SMTP_PASSWORD"),
      authentication:         "plain",
      enable_starttls_auto:   true
    }
  end
end
