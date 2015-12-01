Rails.application.routes.draw do

  resources :institutions, only: [:show, :index]

  root 'home#show'
end
