class ImagesController < ApplicationController

def create
  @tour = Tour.find(params[:tour_id])
  @image = Image.new(params[:image])
  @image.tour = @tour
  @image.save
  redirect_to tour_path(@tour)
end

def destroy
  @tour = Tour.find(params[:tour_id])
  @image = @tour.images.find(params[:id])
  @image.destroy
  redirect_to tour_path(@tour)
end  
  
end
