Andina::Application.routes.draw do
   
  resources :posts

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
  match "/about" => "home#about_us", :as => :about_us
  match "/how-to-pay" => "home#how_to_pay", :as => :how_to_pay
  match "/util-information" => "home#util_information", :as => :util_information
  match "/peru" => "home#peru", :as => :peru

  get 'logout' => 'accounts#logout', :as => :logout
  match 'login' => 'accounts#login', :as => :login
  
  root :to => 'home#index'
end
