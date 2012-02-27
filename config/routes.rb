Andina::Application.routes.draw do
   
  resources :accounts

  resources :banners

  resources :tours do
    resources :reviews
    resources :images
    resources :quotes    
  end  
  
  match "/tours/:tour_id/reviews/:id/:method" => "review#destroy"
  match "/tours-by-location" => "tours#index_by_location", :as => :tours_by_location
  match "/tours-by-interest" => "tours#index_by_interest", :as => :tours_by_interest  
  
  match "/home" => "home#index", :as => :home
  match "/contact" => "home#contact_us", :as => :contact_us  

  get 'logout' => 'accounts#logout', :as => :logout
  match 'login' => 'accounts#login', :as => :login
  
  root :to => 'home#index'
end
