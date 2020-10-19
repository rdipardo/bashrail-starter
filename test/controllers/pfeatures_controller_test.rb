require 'test_helper'

class PfeaturesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @pfeature = pfeatures(:one)
    mock_sign_in
  end

  test 'should get index' do
    get pfeatures_url
    assert_response :success
  end

  test 'should get new' do
    get new_pfeature_url
    assert_response :success
  end

  test 'should create pfeature' do
    assert_difference('Pfeature.count') do
      post pfeatures_url, params: { pfeature: { active_status: @pfeature.active_status, fdate: @pfeature.fdate, name: @pfeature.name, sort_order: @pfeature.sort_order } }
    end

    assert_redirected_to pfeature_url(Pfeature.last)
  end

  test 'should show pfeature' do
    get pfeature_url(@pfeature)
    assert_response :success
  end

  test 'should get edit' do
    get edit_pfeature_url(@pfeature)
    assert_response :success
  end

  test 'should update pfeature' do
    @pfeature = pfeatures(:two)

    patch pfeature_url(@pfeature), params: { pfeature: { active_status: @pfeature.active_status, fdate: @pfeature.fdate, name: @pfeature.name, sort_order: @pfeature.sort_order } }

    assert_redirected_to pfeature_url(@pfeature)
  end

  test 'should destroy pfeature' do
    assert_difference('Pfeature.count', -1) do
      delete pfeature_url(@pfeature)
    end

    assert_redirected_to pfeatures_url
  end
end
