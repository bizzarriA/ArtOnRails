ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/rails"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  include Devise::Test::IntegrationHelpers

  set_fixture_class :asta => Asta
  set_fixture_class :offerta => Offerta

  def current_user
    @current_user
  end

  setup do
    @current_user = users(:current_user)
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
