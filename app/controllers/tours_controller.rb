class ToursController < ApplicationController

  skip_before_filter :check_account, :only => [:index, :index_by_location, :index_by_interest, :show]
  
  before_action :set_tour, only: [:show, :edit, :update, :destroy]
  
  # GET /tours
  # GET /tours.xml
  def index
    if current_account
      @header_tab = "tour"
      @tours = Tour.all
      render :layout => "admin"
    else
      @header_tab = "tour"
      @tours = Tour.order("popularity").where("place = 0 and interest_id is null").all
      if session[:tour_header].nil? then
        @tour = Tour.order("RAND()").first
        session[:tour_header] = @tour.id
      else
        @tour = Tour.find(session[:tour_header])
      end      
      render :layout => "application"
    end
  end
  
  def index_by_location
      @header_tab = "location"
      @tours = Tour.order("popularity").where("place = 1")
      if session[:tour_header].nil? then
        @tour = Tour.order("RAND()").first
        session[:tour_header] = @tour.id unless @tour == nil
      else
        @tour = Tour.find(session[:tour_header])
      end
      render :template => "tours/index", :layout => "application"   
  end
  
  def index_by_interest
      @header_tab = "interest"
      @tours = Tour.order("popularity").where("interest_id is not null and place = 0").all
      if session[:tour_header].nil? then
        @tour = Tour.order("RAND()").first
        session[:tour_header] = @tour.id unless @tour == nil
      else
        @tour = Tour.find(session[:tour_header])
      end
      @interests = Interest.all
      render :template => "tours/index", :layout => "application"    
  end

  # GET /tours/1
  # GET /tours/1.xml
  def show
    
    if current_account
      @header_tab = "tour"
      @review = Review.new
      render :layout => "admin"
    else
      if (@tour.interest and @tour.place == false) then
        @header_tab = "interest"
      elsif (@tour.place) then
        @header_tab = "location"
      else
        @header_tab = "tour"
      end
      render :template => "tours/show", :layout => "application"
    end
  end

  # GET /tours/new
  # GET /tours/new.xml
  def new
    @header_tab = "tour"
    @tour = Tour.new
    render :layout => "admin"
  end

  # GET /tours/1/edit
  def edit
    @header_tab = "tour"
    render :layout => "admin"
  end

  # POST /tours
  # POST /tours.xml
  def create    
    @tour = Tour.new(tour_params)
    respond_to do |format|
      if @tour.save
        format.html { redirect_to tours_path, :notice => 'Se creo el tour exitosamente.' }
        format.xml  { render :xml => @tour, :status => :created, :location => @tour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tours/1
  # PUT /tours/1.xml
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to tours_path, :notice => 'Se actualizo el tour exitosamente.' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.xml
  def destroy
      
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to(tours_url) }
      format.xml  { head :ok }
    end
  end    
  
  private
  
  def set_tour
      @tour = Tour.friendly.find(params[:id])
  end
  
    def tour_params
      params.require(:tour).permit(:title, :subtitle, :short_description,:short_itinerary,:itinerary,:days,:nights,:price,:place,:interest_id,:popularity)
    end  
  
end
