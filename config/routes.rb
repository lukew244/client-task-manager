Rails.application.routes.draw do

  root 'homepage#index'


  devise_for :users
  resources :users, except: :create

  post 'create_user' => 'users#create', as: :create_user

  resources :tasks


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
