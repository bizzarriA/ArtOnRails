require 'test_helper'

# Test: Utente non loggato visualizza profilo altro utente passando per la ricerca e l'opera di interesse.

class ViewProfileFlowsTest < ActionDispatch::IntegrationTest
  test "cerco_trovo_opera_seleziono_artista" do
    get '/'
    assert_equal 200, status
    assert_equal '/', path
    assert_select 'h1', 'ART ON RAILS'

    get '/searches/new'
    assert_equal 200, status
    assert_equal '/searches/new', path

    post '/searches',
         params: { search: {titolo: 'All'}}
    assert_response :redirect
    follow_redirect!
    assert_equal '/searches', path

    get '/operas/1'
    assert_equal 200, status
    assert_equal '/operas/1', path
    assert_select 'h3', 'titolo'

    get '/users?id=1'
    assert_equal 200, status
    assert_select 'h4', 'NomeRicerca'


  end
end
