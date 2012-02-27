class ReviewsController < ApplicationController

def create
  @tour = Tour.find(params[:tour_id])
  @review = Review.new(params[:review])
  @review.tour = @tour
  @review.save
  redirect_to tour_path(@tour)
end

  def edit
    @header_tab = "tour"
    @tour = Tour.find(params[:tour_id])
    @review = Review.find(params[:id])
    render :layout => "admin"
  end

def update
  @review = Review.find(params[:id])
  respond_to do |format|
    if @review.update_attributes(params[:review])
      format.html { redirect_to(tour_path(@review.tour), :notice => 'Se actualizo exitosamente.') }
      format.xml  { head :ok }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
    end
  end
end

def destroy
  @tour = Tour.find(params[:tour_id])
  @review = @tour.reviews.find(params[:id])
  @review.destroy
  redirect_to tour_path(@tour)
end  
  
end
