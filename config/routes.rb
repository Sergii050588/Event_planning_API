Rails.application.routes.draw do
  root 'index#index'
  match 'auth/:provider/callback', via: [:get], to: 'sessions#create'
  match 'auth/failure',via: [:get], to: redirect('/')
  match 'signout', via: [:get], to: 'sessions#destroy', as: 'signout'

  resources :events
  post 'events/:id/comments' => 'comments#create', as: :event_comments

end
