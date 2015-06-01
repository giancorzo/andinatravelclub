class ImagesController < ApplicationController
    
before_action :set_tour, only: [:create, :destroy]        
    
def create
  @image = Image.new(params[:image])
  @image.tour = @tour
  @image.save
  redirect_to tour_path(@tour)
end

def destroy
  @image = @tour.images.find(params[:id])
  @image.destroy
  redirect_to tour_path(@tour)
end      

private

def set_tour
    @tour = Tour.find(params[:tour_id])
end
    
end
