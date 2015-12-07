Rails.application.routes.draw do

  resources :institutions, only: [:show, :index]
  resources :objects, only: [:show, :index], controller: 'things'
  resources :prints, only: [:index, :show]
  resources :boxes, only: [:index, :show]
  resources :boops, only: [:index, :create]

  root 'pages#home'
 
  get '/boxes/:id/list' => 'boxes#list'
 
  get '/about' => 'pages#about'
  get '/sowhat' => 'pages#sowhat'
  get '/help' => 'pages#help'
  get '/contact' => 'pages#contact'
  
end
