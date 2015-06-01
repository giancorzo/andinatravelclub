class QuotesController < ApplicationController

  skip_before_filter :check_account, :only => [:create,:thank_you,:thank_you_contact]  
    
  def create
    @tour = Tour.friendly.find(params[:tour_id])
    @quote = Quote.new(quote_params)
    @quote.tour = @tour
    if @quote.save
      QuotesMailer.send_notification(@quote).deliver_now
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
  
  private
  
  def quote_params
    params.require(:quote).permit(:travel_type, :days, :travel_time, :travel_time, :travel_time, :adults, 
                                  :childs, :age, :name, :country, :city, :phone, :email, :payment_type, :comments)
  end
      
end
