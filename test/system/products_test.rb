require 'application_system_test_case'
require 'test_helper'

class ProductsTest < ApplicationSystemTestCase
  setup do
    producer = \
      CountryOfOrigin.create! name: Faker::Name.unique.name,
                              ctype: '61',
                              fdate: Time.now
    @product = \
      Product.create! name: Faker::Commerce.product_name,
                      pcolor: Faker::Color.color_name,
                      pdate: Time.now,
                      country_of_origin_id: producer.id,
                      active_status: 1,
                      sort_order: 3
    web_sign_in
  end

  test 'visiting the index' do
    visit products_url
    assert_selector 'h4', text: 'Listing Products'
  end

  test 'creating a Product' do
    visit products_url
    click_on 'Create'

    fill_in 'Active status', with: @product.active_status
    select(@product.country_of_origin.name,
           from: 'product[country_of_origin_id]').select_option
    fill_in 'Name', with: @product.name
    fill_in 'Pcolor', with: @product.pcolor
    fill_in 'Sort order', with: @product.sort_order

    click_on 'Create'

    assert_text "Successfully CREATED\nName: #{@product.name}"
    click_on 'Back'
  end

  test 'updating a Product' do
    new_producer =  \
      CountryOfOrigin.create! name: Faker::Name.unique.name,
                              ctype: '99',
                              fdate: Time.now
    @product.country_of_origin_id = new_producer.id

    visit products_url
    click_on 'Edit', match: :first

    fill_in 'Active status', with: @product.active_status
    select(@product.country_of_origin.name,
           from: 'product[country_of_origin_id]').select_option
    fill_in 'Name', with: @product.name
    fill_in 'Pcolor', with: @product.pcolor
    fill_in 'Sort order', with: @product.sort_order

    click_on 'Update Product'

    assert_text "Successfully UPDATED\nName: #{@product.name}"
    click_on 'Back'
  end

  # test 'destroying a Product' do
  # visit products_url
  # page.accept_confirm do
  # click_on 'Destroy', match: :first
  # end

  # assert_text 'Product was successfully destroyed'
  # end
end
