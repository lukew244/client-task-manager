Rails.application.routes.draw do

  root 'tasks#index'

  devise_for :users
  resources :users, except: :create

  post 'create_user' => 'users#create', as: :create_user

  resources :tasks do
    member do
      put 'mark_complete', to: 'tasks#mark_complete'
    end
  end

  get 'admin/tasks', to: 'admin#tasks_index'

end
