require 'test_helper'

class ExamplesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @example = examples("\u{4e00}")
    mock_sign_in
  end

  test 'should get index' do
    get examples_url
    assert_response :success
  end

  test 'should get new' do
    get new_example_url
    assert_response :success
  end

  test 'should create example' do
    assert_difference('Example.count') do
      post examples_url, params: { example: { color: @example.color, name: @example.name } }
    end

    assert_redirected_to example_url(Example.last)
  end

  test 'should show example' do
    get example_url(@example)
    assert_response :success
  end

  test 'should get edit' do
    get edit_example_url(@example)
    assert_response :success
  end

  test 'should update example' do
    @example = examples("\u{4e8c}")

    patch example_url(@example), params: { example: { color: @example.color, name: @example.name } }

    assert_redirected_to example_url(@example)
  end

  test 'should destroy example' do
    assert_difference('Example.count', -1) do
      delete example_url(@example)
    end

    assert_redirected_to examples_url
  end
end
