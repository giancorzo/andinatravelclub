Rails.application.routes.draw do
  resources :media
  resources :posts, path: '/blog'
  resources :accounts
  resources :tours
  resources :banners
  
  get 'logout' => 'accounts#logout', :as => :logout
  match 'login' => 'accounts#login', :as => :login, via: [:get, :post]
end
