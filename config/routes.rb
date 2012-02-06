Andina::Application.routes.draw do
   
  resources :banners

  resources :tours do
    resources :reviews
    resources :images
  end
  
  match "/tours/:tour_id/reviews/:id/:method" => "review#destroy"
  
  match "/home" => "home#index"
  
  root :to => 'home#index', :as => :home
end
