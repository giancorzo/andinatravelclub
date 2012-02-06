class ReviewsController < ApplicationController

def create
  @tour = Tour.find(params[:tour_id])
  @review = Review.new(params[:review])
  @review.tour = @tour
  @review.save
  redirect_to tour_path(@tour)
end

def destroy
  @tour = Tour.find(params[:tour_id])
  @review = @tour.reviews.find(params[:id])
  @review.destroy
  redirect_to tour_path(@tour)
end  
  
end
