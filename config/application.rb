require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Veggies
  class Application < Rails::Application

    config.autoload_paths += Dir["#{config.root}/app/services/**/*"]
    config.i18n.default_locale = :he

  end
end
