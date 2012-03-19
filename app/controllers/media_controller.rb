class MediaController < ApplicationController
  # GET /media
  # GET /media.xml
  def index
    @header_tab = "media"
    @media = Medium.all
    render :layout => "admin"
  end

  # GET /media/1
  # GET /media/1.xml
  def show
    @header_tab = "media"
    @medium = Medium.find(params[:id])
    render :layout => "admin"

  end

  # GET /media/new
  # GET /media/new.xml
  def new
    @header_tab = "media"
    @medium = Medium.new
    render :layout => "admin"

  end

  # GET /media/1/edit
  def edit
    @header_tab = "media"
    @medium = Medium.find(params[:id])
    render :layout => "admin"    
  end

  # POST /media
  # POST /media.xml
  def create
    @medium = Medium.new(params[:medium])

    respond_to do |format|
      if @medium.save
        format.html { redirect_to(@medium, :notice => 'Medium was successfully created.') }
        format.xml  { render :xml => @medium, :status => :created, :location => @medium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /media/1
  # PUT /media/1.xml
  def update
    @medium = Medium.find(params[:id])

    respond_to do |format|
      if @medium.update_attributes(params[:medium])
        format.html { redirect_to(@medium, :notice => 'Medium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.xml
  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to(media_url) }
      format.xml  { head :ok }
    end
  end
end
