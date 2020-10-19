require 'application_system_test_case'
require 'test_helper'

class RolesTest < ApplicationSystemTestCase
  setup do
    @role = Role.new name: Faker::Job.position, description: Faker::Lorem.sentence
    web_sign_in
  end

  test 'visiting the index' do
    visit roles_url
    assert_selector 'h4', text: 'Listing Roles'
  end

  test 'creating a Role' do
    visit roles_url
    click_on 'Create'

    fill_in 'Active status', with: @role.active_status
    fill_in 'Description', with: @role.description
    fill_in 'Name', with: @role.name
    fill_in 'Sort', with: @role.sort_order
    click_on 'Create'

    assert_text "Successfully CREATED\nName: #{@role.name}"
    click_on 'Back'
  end

  test 'updating a Role' do
    visit roles_url
    click_on 'Edit', match: :first

    fill_in 'Active status', with: @role.active_status
    fill_in 'Description', with: @role.description
    fill_in 'Name', with: @role.name
    fill_in 'Sort', with: @role.sort_order
    click_on 'Update Role'

    assert_text "Successfully UPDATED\nName: #{@role.name}"
    click_on 'Back'
  end

  # test 'destroying a Role' do
  # visit roles_url
  # page.accept_confirm do
  # click_on 'Destroy', match: :first
  # end

  # assert_text 'Role was successfully destroyed'
  # end
end
