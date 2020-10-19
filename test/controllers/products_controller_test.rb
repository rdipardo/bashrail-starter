require 'test_helper'
require 'faker'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    producer = \
      CountryOfOrigin.create! name: Faker::Address.country,
                              ctype: '19',
                              fdate: Time.now
    @product = \
      Product.create! name: Faker::Commerce.product_name,
                      pcolor: Faker::Color.color_name,
                      pdate: Time.now,
                      country_of_origin_id: producer.id,
                      active_status: 0,
                      sort_order: 1
    mock_sign_in
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post products_url, params: { product: { active_status: @product.active_status, country_of_origin_id: @product.country_of_origin_id, name: @product.name, pcolor: @product.pcolor, pdate: @product.pdate, sort_order: @product.sort_order } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should update product' do
    producer = \
      CountryOfOrigin.create! name: Faker::Address.country,
                              ctype: '33',
                              fdate: Time.now
    @product = \
      Product.create! name: Faker::Commerce.product_name,
                      pcolor: Faker::Color.color_name,
                      pdate: Time.now,
                      country_of_origin_id: producer.id,
                      active_status: 1,
                      sort_order: 2

    patch product_url(@product), params: { product: { active_status: @product.active_status, country_of_origin_id: @product.country_of_origin_id, name: @product.name, pcolor: @product.pcolor, pdate: @product.pdate, sort_order: @product.sort_order } }

    assert_redirected_to product_url(@product)
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
