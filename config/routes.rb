Andina::Application.routes.draw do
   
  resources :media

  resources :posts, path: '/blog'

  resources :accounts

  resources :banners

  
  match "/tours/peru/destino" => "tours#index_by_location", :as => :tours_by_location
  match "/tours/peru/interes" => "tours#index_by_interest", :as => :tours_by_interest
  
  
  resources :tours, path: '/tours/peru' do
    resources :reviews
    resources :images
    resources :quotes
  end 
  
  match "/tours/:id" => redirect("/tours/peru/%{id}")
  match "/tours" => redirect("/tours/peru")
  match "/tours-by-location" => redirect("/tours/peru/destino")
  match "/tours-by-interest" => redirect("/tours/peru/interes")
  
  match "/tours/:tour_id/reviews/:id/:method" => "review#destroy"
  
  match "/home" => "home#index", :as => :home
  match "/contactenos" => "home#contact_us", :as => :contact_us
  match "/nosotros" => "home#about_us", :as => :about_us
  match "/formas-de-pago" => "home#how_to_pay", :as => :how_to_pay
  match "/informacion-util" => "home#util_information", :as => :util_information
  match "/peru" => "home#peru", :as => :peru
  match "/terminos-condiciones" => "home#terms_and_condition", :as => :terms_and_condition
  match "/thank-you" => "quotes#thank_you", :as => :thank_you
  match "/thank-you-contact" => "quotes#thank_you_contact", :as => :thank_you_contact
  
  match "/contact" => redirect("/contactenos")
  match "/about" => redirect("/nosotros")
  match "/how-to-pay" => redirect("/formas-de-pago")
  match "/util-information" => redirect("/informacion-util")
  match "/terms_and_conditions" => redirect("/terminos-condiciones")
  
  match "/paquete1.htm" => redirect("/tours/peru/maravilla-del-mundo")
  match "/paquete2.htm" => redirect("/tours/peru/enigmas-andinos")
  match "/paquete3.htm" => redirect("/tours/peru/ciudades-y-cuidadelas")
  match "/paquete4.htm" => redirect("/tours/peru/camino-inca")
  match "/paquete5.htm" => redirect("/tours/peru/peru-incaico")
  match "/paquete6.htm" => redirect("/tours/peru/misterios-andinos")
  match "/paquete7.htm" => redirect("/tours/peru/santuarios-vivientes")
  match "/paquete8.htm" => redirect("/tours/peru/reinos-ancestrales")
  match "/paquete9.htm" => redirect("/tours/peru/peru-megadiverso")
  match "/paquete10.htm" => redirect("/tours/peru/peru-infinito")
  match "/paquete11.htm" => redirect("/tours/peru/cusco-exclusivo")
  match "/paquete12.htm" => redirect("/tours/peru/peru-y-bolivia")
  match "/viajes_aventura_paquete1.htm" => redirect("/tours/peru/caminata-al-ausangate")
  match "/viajes_aventura_paquete2.htm" => redirect("/tours/peru/machu-picchu-extremo")
  match "/viajes_aventura_paquete3.htm" => redirect("/tours/peru/camino-inca--2")
  match "/viajes_aventura_paquete4.htm" => redirect("/tours/peru/choquequirao-trek")
  match "/viajes_aventura_paquete5.htm" => redirect("/tours/peru/excursion-al-salkantay")
  match "/viajes_ecologico_paquete1.htm" => redirect("/tours/peru/aves-en-la-reserva-de-tambopata")
  match "/viajes_ecologico_paquete2.htm" => redirect("/tours/peru/expediciones-a-la-selva")
  match "/viajes_ecologico_paquete3.htm" => redirect("/tours/peru/iquitos-placentero")
  match "/viajes_ecologico_paquete4.htm" => redirect("/tours/peru/iquitos-sonador")
  match "/viajes_ecologico_paquete5.htm" => redirect("/tours/peru/reserva-pacaya-samiria")
  match "/viajes_lujo_paquete1.htm" => redirect("/tours/peru/lujo-en-el-amazonas")
  match "/viajes_lujo_paquete2.htm" => redirect("/tours/peru/descubra-el-lago-titicaca")
  match "/viajes_lujo_paquete3.htm" => redirect("/tours/peru/peru-unico")
  match "/viajes_gastronomico_paquete1.htm" => redirect("/tours/peru/tour-gastronomico")
  match "/experiencias.htm" => redirect("/nosotros")
  match "/pago.htm" => redirect("/como-pagar")
  match "/nosotros.htm" => redirect("/nosotros")
  match "/cotizador-new.php" => redirect("/contactenos")
  match "/galeria_fotos.htm" => redirect("http://www.facebook.com/andinatravelclub?sk=photos")
  match "/contactenos.php" => redirect("/contactenos")
  match "/skype_andina.htm" => redirect("/home")
  match "/pruebago.htm" => redirect("/home")
  
  get 'logout' => 'accounts#logout', :as => :logout
  match 'login' => 'accounts#login', :as => :login
  
  root :to => 'home#index'
end