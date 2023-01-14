require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module BigchainWalletWebMonolith
  class Application < Rails::Application
    config.load_defaults 6.1

    config.time_zone = 'Brasilia'
    config.autoload_paths   << Rails.root.join('lib')
    config.eager_load_paths << Rails.root.join('lib')
  end
end
