require 'test_helper'

class AddShowAndRemoveFavoriteFlowsTest < ActionDispatch::IntegrationTest
  test "test_add_remove_favorite" do
    get '/'
    assert_equal 200, status

    utente = users(:current_user)
    sign_in utente
    post '/users/sign_in'
    assert_response :redirect
    follow_redirect!

    get '/searches/new'
    assert_equal 200, status
    assert_equal '/searches/new', path

    post '/searches',
         params: { search: {titolo: 'All'}}
    assert_response :redirect
    follow_redirect!
    assert_equal '/searches', path

    get '/favorites/new?opera_id=2'
    assert_response :redirect

    myfavorites = Favorite.find_by_user_id(utente.id)
    opera = operas(:one_due)
    # byebug
    assert_equal myfavorites.opera_id, (opera.id)

    get '/favorites/delete?opera_id=2'
    assert_response :redirect
    myfavorites = Favorite.find_by_user_id(utente.id)
    assert_nil myfavorites



  end
end
