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
  
  match "/paquete1.htm" => redirect("/tours/maravilla-del-mundo")
  match "/paquete2.htm" => redirect("/tours/enigmas-andinos")
  match "/paquete3.htm" => redirect("/tours/ciudades-y-cuidadelas")
  match "/paquete4.htm" => redirect("/tours/camino-inca")
  match "/paquete5.htm" => redirect("/tours/peru-incaico")
  match "/paquete6.htm" => redirect("/tours/misterios-andinos")
  match "/paquete7.htm" => redirect("/tours/santuarios-vivientes")
  match "/paquete8.htm" => redirect("/tours/reinos-ancestrales")
  match "/paquete9.htm" => redirect("/tours/peru-megadiverso")
  match "/paquete10.htm" => redirect("/tours/peru-infinito")
  match "/paquete11.htm" => redirect("/tours/cusco-exclusivo")
  match "/paquete12.htm" => redirect("/tours/peru-y-bolivia")
  match "/viajes_aventura_paquete1.htm" => redirect("/tours/caminata-al-ausangate")
  match "/viajes_aventura_paquete2.htm" => redirect("/tours/machu-picchu-extremo")
  match "/viajes_aventura_paquete3.htm" => redirect("/tours/camino-inca--2")
  match "/viajes_aventura_paquete4.htm" => redirect("/tours/choquequirao-trek")
  match "/viajes_aventura_paquete5.htm" => redirect("/tours/excursion-al-salkantay")
  match "/viajes_ecologico_paquete1.htm" => redirect("/tours/aves-en-la-reserva-de-tambopata")
  match "/viajes_ecologico_paquete2.htm" => redirect("/tours/expediciones-a-la-selva")
  match "/viajes_ecologico_paquete3.htm" => redirect("/tours/iquitos-placentero")
  match "/viajes_ecologico_paquete4.htm" => redirect("/tours/iquitos-sonador")
  match "/viajes_ecologico_paquete5.htm" => redirect("/tours/reserva-pacaya-samiria")
  match "/viajes_lujo_paquete1.htm" => redirect("/tours/lujo-en-el-amazonas")
  match "/viajes_lujo_paquete2.htm" => redirect("/tours/descubra-el-lago-titicaca")
  match "/viajes_lujo_paquete3.htm" => redirect("/tours/peru-unico")
  match "/viajes_gastronomico_paquete1.htm" => redirect("/tours/tour-gastronomico")
  match "/experiencias.htm" => redirect("/about")
  match "/pago.htm" => redirect("/how-to-pay")
  match "/nosotros.htm" => redirect("/about")
  match "/cotizador-new.php" => redirect("/contact")
  match "/galeria_fotos.htm" => redirect("http://www.facebook.com/andinatravelclub?sk=photos")
  match "/contactenos.php" => redirect("/contact")
  match "/skype_andina.htm" => redirect("/home")
  match "/pruebago.htm" => redirect("/home")
  
  get 'logout' => 'accounts#logout', :as => :logout
  match 'login' => 'accounts#login', :as => :login
  
  root :to => 'home#index'
end
