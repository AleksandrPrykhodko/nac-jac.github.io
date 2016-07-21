require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NacJacGithubIo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << Rails.root.join('/app/assets/fonts')

    ActiveMerchant::Billing::Base.mode = :test
      ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
        :login => 'uncoder-facilitator_api1.gmail.com',
        :password => '2H5MSMHW5QU6KQTX',
        :signature => 'AFcWxV21C7fd0v3bYYYRCpSSRl31AWpV87FZYT2XbbE20mwF1QflRrHS'
      )
  end
end
