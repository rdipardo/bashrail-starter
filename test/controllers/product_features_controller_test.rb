require 'test_helper'
require 'faker'

class ProductFeaturesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    feature = Pfeature.create! name: Faker::Commerce.color
    producer = \
      CountryOfOrigin.create! name: Faker::Address.country,
                              ctype: '13',
                              fdate: Time.now
    product = \
      Product.create! name: Faker::Commerce.product_name,
                      country_of_origin_id: producer.id
    @prod_feat = \
      ProductFeature.create! name: product.name,
                             product_id: product.id,
                             pfeature_id: feature.id,
                             sort_order: 1,
                             active_status: 1
    mock_sign_in
  end

  test 'should get index' do
    get product_features_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_feature_url
    assert_response :success
  end

  test 'should create product_feature' do
    assert_difference('ProductFeature.count') do
      post product_features_url, params: {
        product_feature: {
          active_status: @prod_feat.active_status,
          name: @prod_feat.name,
          pfeature_id: @prod_feat.pfeature_id,
          product_id: @prod_feat.product_id,
          sort_order: @prod_feat.sort_order
        }
      }
    end

    assert_redirected_to product_feature_url(ProductFeature.last)
  end

  test 'should show product_feature' do
    get product_feature_url(@prod_feat)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_feature_url(@prod_feat)
    assert_response :success
  end

  test 'should update product_feature' do
    feature = Pfeature.create! name: Faker::Commerce.color
    producer = \
      CountryOfOrigin.create! name: Faker::Address.country,
                              ctype: '27',
                              fdate: Time.now
    product = \
      Product.create! name: Faker::Commerce.product_name,
                      country_of_origin_id: producer.id
    @prod_feat = \
      ProductFeature.create! name: product.name,
                             product_id: product.id,
                             pfeature_id: feature.id,
                             sort_order: 2,
                             active_status: 0
    patch product_feature_url(@prod_feat), params: { product_feature: {
      active_status: @prod_feat.active_status,
      name: @prod_feat.name,
      pfeature_id: @prod_feat.pfeature_id,
      product_id: @prod_feat.product_id,
      sort_order: @prod_feat.sort_order
    } }

    assert_redirected_to product_feature_url(@prod_feat)
  end

  test 'should destroy product_feature' do
    assert_difference('ProductFeature.count', -1) do
      delete product_feature_url(@prod_feat)
    end

    assert_redirected_to product_features_url
  end
end
