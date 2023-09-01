# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
ENV['RAILS_ADMIN_THEME'] = 'rollincode'

module Billinho
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.time_zone = 'Brasilia'
    I18n.config.enforce_available_locales = false
    config.i18n.available_locales = ['pt-BR', :en]
    config.i18n.default_locale = 'pt-BR'
    config.i18n.locale = 'pt-BR'
    config.i18n.fallbacks = [:en] #se nao achar trad em pt, usa em ingles
  end
end
