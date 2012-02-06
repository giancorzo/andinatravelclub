class BannersController < ApplicationController
  # GET /banners
  # GET /banners.xml
  def index
    @banners = Banner.all
    @header_tab = "banner"
    render :layout => "admin"
  end

  # GET /banners/1
  # GET /banners/1.xml
  def show
    @header_tab = "banner"
    @banner = Banner.find(params[:id])
    render :layout => "admin"
  end

  # GET /banners/new
  # GET /banners/new.xml
  def new
    @header_tab = "banner"    
    @banner = Banner.new
    
    render :layout => "admin"
  end

  # GET /banners/1/edit
  def edit
    @header_tab = "banner"    
    @banner = Banner.find(params[:id])
    render :layout => "admin"
  end

  # POST /banners
  # POST /banners.xml
  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        format.html { redirect_to banners_path, :notice => 'Banner was successfully created.' }
      else
        format.html { render :action => "new" }        
      end
    end
  end

  # PUT /banners/1
  # PUT /banners/1.xml
  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        format.html { redirect_to banners_path, :notice => 'Banner was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.xml
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to(banners_url) }
      format.xml  { head :ok }
    end
  end
end
