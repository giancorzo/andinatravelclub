class HomeController < ApplicationController
  
  def index
    @tours = Tour.all
    @banners = Banner.all
  end
end
