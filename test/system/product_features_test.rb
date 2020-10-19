require 'application_system_test_case'
require 'test_helper'

class ProductFeaturesTest < ApplicationSystemTestCase
  setup do
    feature = Pfeature.create! name: Faker::Name.unique.name
    producer = \
      CountryOfOrigin.create! name: Faker::Address.country,
                              ctype: '19',
                              fdate: Time.now
    product = \
      Product.create! name: Faker::Commerce.product_name,
                      country_of_origin_id: producer.id
    @product_feature = \
      ProductFeature.create! name: product.name,
                             product_id: product.id,
                             pfeature_id: feature.id,
                             sort_order: 3,
                             active_status: 0
    web_sign_in
  end

  test 'visiting the index' do
    visit product_features_url
    assert_selector 'h4', text: 'Listing Product Features'
  end

  test 'creating a Product feature' do
    visit product_features_url
    click_on 'Create'

    fill_in 'Active status', with: @product_feature.active_status
    fill_in 'Name', with: @product_feature.name
    select(@product_feature.pfeature.name,
           from: 'product_feature[pfeature_id]').select_option
    select(@product_feature.product.name,
           from: 'product_feature[product_id]').select_option
    fill_in 'Sort order', with: @product_feature.sort_order
    click_on 'Create'

    assert_text "Successfully CREATED\nName: #{@product_feature.name}"
    click_on 'Back'
  end

  test 'updating a Product feature' do
    new_feature = Pfeature.create! name: Faker::Name.unique.name
    @product_feature.pfeature_id = new_feature.id

    visit product_features_url
    click_on 'Edit', match: :first

    fill_in 'Active status', with: @product_feature.active_status
    fill_in 'Name', with: @product_feature.name
    select(@product_feature.pfeature.name,
           from: 'product_feature[pfeature_id]').select_option
    select(@product_feature.product.name,
           from: 'product_feature[product_id]').select_option
    fill_in 'Sort order', with: @product_feature.sort_order
    click_on 'Update Product feature'

    assert_text "Successfully UPDATED\nName: #{@product_feature.name}"
    click_on 'Back'
  end

  # test 'destroying a Product feature' do
  # visit product_features_url
  # page.accept_confirm do
  # click_on 'Destroy', match: :first
  # end

  # assert_text 'Product feature was successfully destroyed'
  # end
end
