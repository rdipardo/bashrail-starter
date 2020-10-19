ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers # https://stackoverflow.com/a/34738884

  ActiveRecord::Migration.check_pending!
  self.test_order = :parallel

  def mock_sign_in
    Rails.application.load_seed

    Warden.test_mode!
    get '/users/sign_in'
    login_as(User.where(email: 'a@e').first, scope: :user)
  end

  def web_sign_in
    Rails.application.load_seed

    visit '/users/sign_in'
    fill_in 'user[email]', with: 'a@e'
    fill_in 'user[password]', with: 'a'
    click_on 'Log in'
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all
end
