require 'watir'
require 'fileutils'
require 'rspec/expectations'
require 'faker'
require 'pry'

Faker::Config.locale = 'en-GB'
$login_details = YAML.load_file("features/support/login_details.yml")