
Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :users, only: [:new, :create]   
  get 'login', to: 'sessions#new'   
  post 'login', to: 'sessions#create'   
  get 'welcome', to: 'sessions#welcome'
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end