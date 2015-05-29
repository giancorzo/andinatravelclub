Rails.application.routes.draw do
  resources :media
  resources :posts, path: '/blog'
  resources :accounts
  resources :banners
  
  get '/tours/peru/destino' => "tours#index_by_location", :as => :tours_by_location
  get '/tours/peru/interes' => "tours#index_by_interest", :as => :tours_by_interest
  
  resources :tours, path: '/tours/peru' do
    resources :reviews
    resources :images
    resources :quotes
  end
  
  get "/home" => "home#index", :as => :home
  get "/contactenos" => "home#contact_us", :as => :contact_us
  get "/nosotros" => "home#about_us", :as => :about_us
  get "/formas-de-pago" => "home#how_to_pay", :as => :how_to_pay
  get "/informacion-util" => "home#util_information", :as => :util_information
  get "/peru" => "home#peru", :as => :peru
  get "/terminos-condiciones" => "home#terms_and_condition", :as => :terms_and_condition
  get "/thank-you" => "quotes#thank_you", :as => :thank_you
  get "/thank-you-contact" => "quotes#thank_you_contact", :as => :thank_you_contact  
  
  get 'logout' => 'accounts#logout', :as => :logout
  match 'login' => 'accounts#login', :as => :login, via: [:get, :post]
  
  root :to => 'home#index'
end
