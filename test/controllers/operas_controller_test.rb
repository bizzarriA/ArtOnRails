require 'test_helper'

class OperasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opera = operas(:one)
  end

  test "should get index" do
    get operas_url
    assert_response :success
  end

  test "should get new" do
    get new_opera_url
    assert_response :success
  end

  test "should create opera" do
    assert_difference('Opera.count') do
      post operas_url, params: { opera: {  } }
    end

    assert_redirected_to opera_url(Opera.last)
  end

  test "should show opera" do
    get opera_url(@opera)
    assert_response :success
  end

  test "should get edit" do
    get edit_opera_url(@opera)
    assert_response :success
  end

  test "should update opera" do
    patch opera_url(@opera), params: { opera: {  } }
    assert_redirected_to opera_url(@opera)
  end

  test "should destroy opera" do
    assert_difference('Opera.count', -1) do
      delete opera_url(@opera)
    end

    assert_redirected_to operas_url
  end
end
