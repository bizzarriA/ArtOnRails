require 'test_helper'

class MakeOffertaFlowsTest < ActionDispatch::IntegrationTest
  test 'make_offerts_test' do
    utente = users(:current_user)
    sign_in utente
    post '/users/sign_in'
    assert_response :redirect
    follow_redirect!

    get '/astas/index'
    assert_equal 200, status

    get '/astas?id=1'
    assert_equal 200, status
    assert_select 'a', 'Fai offerta'

    get '/offertas/new?asta_id=1'
    assert_equal 200, status
    assert_select 'input', ''

    post '/offertas/',
         params: { offerta: { user_id: utente.id, asta_id: 1, importo: 150 }}
    assert_response :redirect
    follow_redirect!
    assert_equal '/user/offerte', path
    assert_select 'td', '150.0 €'
  end
end
