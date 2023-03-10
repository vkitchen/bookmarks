Rails.application.routes.draw do
  root 'bookmarks#index'

  resources :users, :bookmarks

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
end
