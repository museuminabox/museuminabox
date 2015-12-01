Rails.application.routes.draw do

  resources :institutions, only: [:show, :index]
  resources :objects, only: [:show], controller: 'things'

  root 'home#show'
end
