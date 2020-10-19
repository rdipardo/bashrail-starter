require 'application_system_test_case'
require 'test_helper'

class PfeaturesTest < ApplicationSystemTestCase
  setup do
    @pfeature = pfeatures(:one)
    web_sign_in
  end

  test 'visiting the index' do
    visit pfeatures_url
    assert_selector 'h4', text: 'Listing Pfeatures'
  end

  test 'creating a Pfeature' do
    visit pfeatures_url
    click_on 'Create'

    fill_in 'Active status', with: @pfeature.active_status
    fill_in 'Name', with: @pfeature.name
    fill_in 'Sort order', with: @pfeature.sort_order
    click_on 'Create'

    assert_text "Successfully CREATED\nName: #{@pfeature.name}"
    click_on 'Back'
  end

  test 'updating a Pfeature' do
    visit pfeatures_url
    click_on 'Edit', match: :first

    fill_in 'Active status', with: @pfeature.active_status
    fill_in 'Name', with: @pfeature.name
    fill_in 'Sort order', with: @pfeature.sort_order
    click_on 'Update Pfeature'

    assert_text "Successfully UPDATED\nName: #{@pfeature.name}"
    click_on 'Back'
  end

  # test 'destroying a Pfeature' do
  # visit pfeatures_url
  # page.accept_confirm do
  # click_on 'Destroy', match: :first
  # end

  # assert_text 'Pfeature was successfully destroyed'
  # end
end
