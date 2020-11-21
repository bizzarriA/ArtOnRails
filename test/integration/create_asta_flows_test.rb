require 'test_helper'



class CreateAstaFlowsTest < ActionDispatch::IntegrationTest
  test 'test_create_asta_flow' do
    def current_user
      @current_user = users(:two)
    end
    user = users(:two)
    sign_in user
    post '/users/sign_in'
    assert_response :redirect
    follow_redirect!
    assert_equal '/', path
    assert_equal current_user.artista_id, 2

    get '/astas/new'
    assert_response 200
    assert_select 'input', ''
    assert_select 'strong', 'Seleziona Opera'

    post '/astas',
         params: { asta: { opera_id: 3 }, data_inizio: '2021-01-01', ora_inizio: '00:00', data_fine: '2025-01-01', ora_fine:'00:00' }
    assert_response :redirect
    follow_redirect!
    assert_equal '/artista/2/aste', path
    assert_select 'h2', 'MyString'

  end

end
