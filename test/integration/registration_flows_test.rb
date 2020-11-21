require 'test_helper'

# Registrazione come artista e aggiunta di un opera

class RegistrationFlowsTest < ActionDispatch::IntegrationTest
  test 'sign_up' do
    get '/'
    assert_equal 200, status
    assert_equal '/', path
    assert_select 'h1', 'ART ON RAILS'
    get '/users/sign_in'
    assert_equal 200, status
    assert_select 'h2', 'Log in'

    get '/users/sign_up'
    assert_select 'h2', 'Registrati'

    post '/users/',
         params: { user: { email: 'email@test.it', password: 'pwdtest', password_confirmaton: 'pwdtest', username: 'test',
                         nome: 'nome', cognome: 'cognome', dob: '1996-08-21',  } }
    # Verifico che la mail di conferma venga effettivamente inviata
    assert_emails 1
    assert_response :redirect
    follow_redirect!
    assert_equal 200, status
    assert_equal '/', path
  end

  # La conferma dell'email è una funzionalità implementata da devise e quindi già testata

  test 'log in, become a artist and add a opera' do
    # utilizzo user sign_up_flow per verificare il resto del flusso
    user = users(:current_user)
    sign_in user
    post '/users/sign_in'
    assert_response :redirect
    follow_redirect!
    assert_equal '/', path
    assert_select 'li', 5
    assert_equal current_user.artista_id, 3


    get '/artista/new'
    assert_select 'h1', 'Diventa artista!'

    post '/artista'
    assert_response :redirect
    follow_redirect!
    assert_equal '/artista/3', path
    assert_select 'h2', 'Al momento non ci sono opere in questo portfolio!'


    get '/operas/new'
    assert_select 'h1', 'New Opera'
    file = Rack::Test::UploadedFile.new(Rails.root.join("test/fixtures/files/test.jpg"), "image/jpeg")
    post '/operas',
         params: { opera: { titolo: 'titolo', tecnica: 'Acrilico', anno: '2020', url: file, merchandising: 'true', artista_id: 3} }

    assert_response :redirect
    follow_redirect!
    assert_equal '/operas/4', path
  end
end
