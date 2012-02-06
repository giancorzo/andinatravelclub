class ToursController < ApplicationController
  # GET /tours
  # GET /tours.xml
  def index
    @header_tab = "tour"
    @tours = Tour.all
    render :layout => "admin"
  end

  # GET /tours/1
  # GET /tours/1.xml
  def show
    @header_tab = "tour"
    @tour = Tour.find(params[:id])
    render :layout => "admin"
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
    @tour = Tour.find(params[:id])
    render :layout => "admin"
  end

  # POST /tours
  # POST /tours.xml
  def create    
    @tour = Tour.new(params[:tour])

    respond_to do |format|
      if @tour.save
        format.html { redirect_to(@tour, :notice => 'Se creo el tour exitosamente.') }
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
    @tour = Tour.find(params[:id])

    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        format.html { redirect_to(@tour, :notice => 'Se actualizo el tour exitosamente.') }
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
    @tour = Tour.find(params[:id])
    @tour.destroy

    respond_to do |format|
      format.html { redirect_to(tours_url) }
      format.xml  { head :ok }
    end
  end
end
