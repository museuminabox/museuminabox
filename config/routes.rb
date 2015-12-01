Rails.application.routes.draw do

  resources :institutions, only: [:show, :index]
  resources :objects, only: [:show, :index], controller: 'things'
  resources :prints, only: [:index, :show]
  resources :boxes, only: [:index, :show]

  root 'pages#home'
  
  get '/about' => 'pages#about'
  get '/sowhat' => 'pages#sowhat'
  get '/help' => 'pages#help'
  get '/contact' => 'pages#contact'
  
end
