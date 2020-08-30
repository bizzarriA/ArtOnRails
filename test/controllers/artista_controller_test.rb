require 'test_helper'

class ArtistaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artistum = artista(:one)
  end

  test "should get index" do
    get artista_url
    assert_response :success
  end

  test "should get new" do
    get new_artistum_url
    assert_response :success
  end

  test "should create artistum" do
    assert_difference('Artistum.count') do
      post artista_url, params: { artistum: {  } }
    end

    assert_redirected_to artistum_url(Artistum.last)
  end

  test "should show artistum" do
    get artistum_url(@artistum)
    assert_response :success
  end

  test "should get edit" do
    get edit_artistum_url(@artistum)
    assert_response :success
  end

  test "should update artistum" do
    patch artistum_url(@artistum), params: { artistum: {  } }
    assert_redirected_to artistum_url(@artistum)
  end

  test "should destroy artistum" do
    assert_difference('Artistum.count', -1) do
      delete artistum_url(@artistum)
    end

    assert_redirected_to artista_url
  end
end
