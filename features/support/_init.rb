require 'watir'
require 'fileutils'
require 'rspec/expectations'
require 'faker'
require 'pry'

Faker::Config.locale = 'en-GB'
# Require model
page_object_dir = File.expand_path('../../../model', __FILE__)
Dir.glob File.join(page_object_dir, 'model', '*.rb'), &method(:require)
# Require mapping classes
Dir.glob File.join(page_object_dir, 'mapping', '**', '*.rb'), &method(:require)