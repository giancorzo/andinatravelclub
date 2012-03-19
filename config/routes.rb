Andina::Application.routes.draw do
   
  resources :media

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
  match "/terms_and_conditions" => "home#terms_and_condition", :as => :terms_and_condition
  match "/thank-you" => "quotes#thank_you", :as => :thank_you
   match "/thank-you-contact" => "quotes#thank_you_contact", :as => :thank_you_contact

  get 'logout' => 'accounts#logout', :as => :logout
  match 'login' => 'accounts#login', :as => :login
  
  root :to => 'home#index'
end
