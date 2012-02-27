class HomeController < ApplicationController
  
  skip_before_filter :check_account
  
  def index
    @tours = Tour.order("popularity").where("place = 0 and interest_id is null").all
    @banners = Banner.all
    @reviews = Review.all
  end
  
  def contact_us
    if request.post?
      QuotesMailer.send_contact(params[:contact]).deliver
    end
    
    @tour = Tour.order("RAND()").first
    @tours = Tour.order("RAND()").limit(6)
  end
end
