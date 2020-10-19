require 'test_helper'

class CountryOfOriginsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @country_of_origin = country_of_origins(:premier)
    mock_sign_in
  end

  test 'should get index' do
    get country_of_origins_url
    assert_response :success
  end

  test 'should get new' do
    get new_country_of_origin_url
    assert_response :success
  end

  test 'should create country_of_origin' do
    assert_difference('CountryOfOrigin.count') do
      post country_of_origins_url, params: { country_of_origin: { active_status: @country_of_origin.active_status, ctype: @country_of_origin.ctype, fdate: @country_of_origin.fdate, name: @country_of_origin.name, sort_order: @country_of_origin.sort_order } }
    end

    assert_redirected_to country_of_origin_url(CountryOfOrigin.last)
  end

  test 'should show country_of_origin' do
    get country_of_origin_url(@country_of_origin)
    assert_response :success
  end

  test 'should get edit' do
    get edit_country_of_origin_url(@country_of_origin)
    assert_response :success
  end

  test 'should update country_of_origin' do
    @country_of_origin = country_of_origins(:deuxieme)

    patch country_of_origin_url(@country_of_origin), params: { country_of_origin: { active_status: @country_of_origin.active_status, ctype: @country_of_origin.ctype, fdate: @country_of_origin.fdate, name: @country_of_origin.name, sort_order: @country_of_origin.sort_order } }

    assert_redirected_to country_of_origin_url(@country_of_origin)
  end

  test 'should destroy country_of_origin' do
    assert_difference('CountryOfOrigin.count', -1) do
      delete country_of_origin_url(@country_of_origin)
    end

    assert_redirected_to country_of_origins_url
  end
end
