require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

APPNAME='pagespeeder.io'

module Pagespeed
  class Application < Rails::Application
    config.i18n.load_path += Dir[config.root.join('frontend/components/**/*.yml')]
    config.autoload_paths += Dir[config.root.join('frontend/components/**/**/')]

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.autoloader=:classic
  end
end
