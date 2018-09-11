Rails.application.routes.draw do
  resources :givings
  resources :adoptions
  resources :pets
  resources :stores
  resources :users

  get 'sessions/new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
