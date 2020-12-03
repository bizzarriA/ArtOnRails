Rails.application.routes.draw do
  devise_for :users, controllers: {sessions:'users/sessions', registrations: 'users/registrations',
                                   passwords:'users/passwords', confirmations: 'users/confirmations'}
  devise_scope :user do
    get '/user/sign_out', to: 'users/sessions#destroy'
  end
  resource :users, only: [:show]
  get '/user/offerte', to: 'users#offerte', as: 'user_offerte'
  resources :pagamentos
  resources :operas, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :artista
  get '/artista/:id/aste', to: 'artista#aste', as: 'artistum_aste'
  resource :searches
  resource :acquistos
  resource :astas
  get '/astas/index', to: 'astas#index', as: 'astas_index'
  get '/astas/win', to: 'astas#win', as: 'win_astas'
  resource :offertas
  resource :favorites, only: [:new, :show]
  get '/favorites/delete', to: 'favorites#destroy', as: 'del_favorites'
  get '/404', to: 'errors#not_found'
  get '/442', to: 'errors#record_not_found'
  get '/500', to: 'errors#internal_server_error'
  root to: 'homes#index'
end
