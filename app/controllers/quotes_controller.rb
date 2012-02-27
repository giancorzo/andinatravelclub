class QuotesController < ApplicationController

skip_before_filter :check_account, :only => [:create]  
  
def create
  @tour = Tour.find(params[:tour_id])
  @quote = Quote.new(params[:quote])
  @quote.tour = @tour
  if @quote.save
    QuotesMailer.send_notification(@quote).deliver
    flash[:notice] = "Su cotizacion se envio exitosamente."
  else
    flash[:error] = "Por favor ingrese todos los campos del formulario"
  end 
  redirect_to tour_path(@tour)
end

def destroy
  @tour = Tour.find(params[:tour_id])
  @quote = @tour.quotes.find(params[:id])
  @quote.destroy
  redirect_to tour_path(@tour)
end  
  
end
