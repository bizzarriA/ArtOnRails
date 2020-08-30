require 'test_helper'

class CompratoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compratore = compratores(:one)
  end

  test "should get index" do
    get compratores_url
    assert_response :success
  end

  test "should get new" do
    get new_compratore_url
    assert_response :success
  end

  test "should create compratore" do
    assert_difference('Compratore.count') do
      post compratores_url, params: { compratore: {  } }
    end

    assert_redirected_to compratore_url(Compratore.last)
  end

  test "should show compratore" do
    get compratore_url(@compratore)
    assert_response :success
  end

  test "should get edit" do
    get edit_compratore_url(@compratore)
    assert_response :success
  end

  test "should update compratore" do
    patch compratore_url(@compratore), params: { compratore: {  } }
    assert_redirected_to compratore_url(@compratore)
  end

  test "should destroy compratore" do
    assert_difference('Compratore.count', -1) do
      delete compratore_url(@compratore)
    end

    assert_redirected_to compratores_url
  end
end
