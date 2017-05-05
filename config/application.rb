require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ApiMuncher
  class Application < Rails::Application
    # Force new test files to be generated in the minitest-spec style

    #this loads everything in the lib folder automatically
    config.autoload_paths << Rails.root.join('app/lib')
    config.eager_load_paths << "#{Rails.root}/lib"
    
    config.generators do |g|
      g.test_framework :minitest, spec: true
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
