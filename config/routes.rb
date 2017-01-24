Rails.application.routes.draw do
  root to: 'events#index'
  match 'auth/:provider/callback', via: [:get], to: 'sessions#create'
  match 'auth/failure',via: [:get], to: redirect('/')
  match 'signout', via: [:get], to: 'sessions#destroy', as: 'signout'

  resources :events

end
