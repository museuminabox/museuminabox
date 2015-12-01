Rails.application.routes.draw do

  resources :institutions, only: [:show, :index]
  resources :objects, only: [:show, :index], controller: 'things'
  resources :prints, only: [:index, :show]
  resources :boxes, only: [:index, :show]

  root 'home#show'
  
match '/home' => 'pages#home'
match '/about' => 'pages#about'
  
end
