require "simplecov"
SimpleCov.start "rails"

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require "minitest/rails/capybara"
require 'webmock'
require 'vcr'
require "minitest-vcr"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end
  MinitestVcr::Spec.configure!

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
