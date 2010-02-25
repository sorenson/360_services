ENV['RAILS_ENV'] = "cucumber"
require 'rubygems'
require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
require 'webrat'
require 'webrat/core/matchers'
# require 'fakeweb'
# require 'netrecorder'
require "#{File.dirname(__FILE__)}/../../lib/sorenson/services.rb"

Webrat.configure do |config|
  config.mode = :rails
  config.open_error_files = false # Set to true if you want error pages to pop up in the browser
end
