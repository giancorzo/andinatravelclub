class QuotesController < ApplicationController

skip_before_filter :check_account, :only => [:create,:thank_you,:thank_you_contact]  
  
def create
  @tour = Tour.find(params[:tour_id])
  @quote = Quote.new(params[:quote])
  @quote.tour = @tour
  if @quote.save
    QuotesMailer.send_notification(@quote).deliver
    redirect_to :thank_you and return
  else
    flash[:error] = "Por favor ingrese todos los campos del formulario"
  end 
  redirect_to tour_path(@tour)
end

def thank_you
  @tours = Tour.order("popularity").limit(4)
end

def thank_you_contact
  @tours = Tour.order("popularity").limit(4)
end

def destroy
  @tour = Tour.find(params[:tour_id])
  @quote = @tour.quotes.find(params[:id])
  @quote.destroy
  redirect_to tour_path(@tour)
end  
  
end
