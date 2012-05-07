class HomeController < ApplicationController
  
  skip_before_filter :check_account
  
  def index
    @tours = Tour.order("popularity").where("place = 0 and interest_id is null").all
    @banners = Banner.all
    @reviews = Review.where("home = 1").all
  end
  
  def contact_us
    @header_tab = "contact"
    if request.post?
      QuotesMailer.send_contact(params[:contact]).deliver
      redirect_to :thank_you_contact and return
    end

    @tours = Tour.order("RAND()").limit(6)
  end
  
  def about_us
    @tour = Tour.order("RAND()").first
    @reviews = Review.order("RAND()").limit(10)
  end
  
  def how_to_pay
    @tour = Tour.order("RAND()").first
  end
  
  def peru
    @tour = Tour.order("RAND()").first
  end
  
  def util_information
    @tour = Tour.order("RAND()").first
  end
  
  def terms_and_condition
    @tour = Tour.order("RAND()").first
  end
  
end
