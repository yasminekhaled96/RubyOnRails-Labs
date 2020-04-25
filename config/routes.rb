
Rails.application.routes.draw do
   match ':controller(/:action(/:id))(.:format)'
  root :to => 'sessions#login'
  match "signup", :to => "users#new"
  match "login", :to => "sessions#login"
  match "logout", :to => "sessions#logout"
  match "home", :to => "sessions#home"
  
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
end