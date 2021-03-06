# Add current path and lib to the load path
$: << File.expand_path('../../', __FILE__)
$: << File.expand_path('../../lib', __FILE__)

# Default ENV to dev if not present
ENV['RACK_ENV'] ||= 'development'

# Autoload gems from the Gemfile
require "bundler"
Bundler.require :default, ENV['RACK_ENV'].to_sym

# Load dev env vars
Dotenv.load if ["development", "test"].include? ENV['RACK_ENV']

# Autoload app dependencies
(Dir['./config/initializers/*.rb'].sort +
 Dir['./app/helpers/**/*.rb'].sort +
 Dir['./app/mailers/**/*.rb'].sort +
 Dir['./app/models/**/*.rb'].sort
).uniq.each { |rb| require rb }
