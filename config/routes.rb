Rails.application.routes.draw do
  devise_for :users, controllers: {sessions:'users/sessions', registrations: 'users/registrations',
                                   passwords:'users/passwords', confirmations: 'users/confirmations'}
  devise_scope :user do
    get '/user/sign_out', to: 'users/sessions#destroy'
  end
  resource :users, only: [:show]
  resources :pagamentos
  resources :operas
  resources :artista
  resource :searches
  resource :acquistos
  resource :favorites, only: [:new, :show]
  get '/favorites/delete', to: 'favorites#destroy', as: 'del_favorites'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
end
