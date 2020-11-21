require 'test_helper'

class AcquistoFlowsTest < ActionDispatch::IntegrationTest
  test "acquisto_flow" do
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
         params: { search: { titolo: 'All' } }
    assert_response :redirect
    follow_redirect!
    assert_equal '/searches', path

    get '/acquistos/new?opera_id=2'
    assert_response 200
    assert_select 'h3', 'MyString'
    
    post '/acquistos',
         params: { acquisto: { user_id: utente.id, pagamento_id: 2, opera_id: 2 } }
    assert_response :redirect
    follow_redirect!
    assert_equal '/acquistos', path

    acquisti = Acquisto.where("user_id = ?", utente.id)
    assert acquisti.ids.include?(operas(:one_due).id)

  end
end
