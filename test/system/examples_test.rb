require 'application_system_test_case'
require 'test_helper'

class ExamplesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @example = examples("\u{4e00}")
    web_sign_in
  end

  test 'visiting the index' do
    visit examples_url
    assert_selector 'h4', text: 'Listing Examples'
  end

  test 'creating a Example' do
    visit examples_url
    click_on 'Create'

    fill_in 'Color', with: @example.color
    fill_in 'Name', with: @example.name
    click_on 'Create'

    assert_text "Successfully CREATED\nName: #{@example.name}"
    click_on 'Back'
  end

  test 'updating a Example' do
    visit examples_url
    click_on 'Edit', match: :first

    fill_in 'Color', with: @example.color
    fill_in 'Name', with: @example.name
    click_on 'Update Example'

    assert_text "Successfully UPDATED\nName: #{@example.name}"
    click_on 'Back'
  end
end
