require 'application_system_test_case'
require 'test_helper'

class CountryOfOriginsTest < ApplicationSystemTestCase
  setup do
    @country_of_origin = country_of_origins(:deuxieme)
    web_sign_in
  end

  test 'visiting the index' do
    visit country_of_origins_url
    assert_selector 'h4', text: 'Listing Country Of Origins'
  end

  test 'creating a Country of origin' do
    visit country_of_origins_url
    click_on 'Create'

    fill_in 'Active status', with: @country_of_origin.active_status
    fill_in 'Ctype', with: @country_of_origin.ctype
    fill_in 'Name', with: @country_of_origin.name
    fill_in 'Sort order', with: @country_of_origin.sort_order
    click_on 'Create'

    assert_text "Successfully CREATED\nName: #{@country_of_origin.name}"
    click_on 'Back'
  end

  test 'updating a Country of origin' do
    visit country_of_origins_url
    click_on 'Edit', match: :first

    fill_in 'Active status', with: @country_of_origin.active_status
    fill_in 'Ctype', with: @country_of_origin.ctype
    fill_in 'Name', with: @country_of_origin.name
    fill_in 'Sort order', with: @country_of_origin.sort_order
    click_on 'Update Country of origin'

    assert_text "Successfully UPDATED\nName: #{@country_of_origin.name}"
    click_on 'Back'
  end
end
