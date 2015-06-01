class BannersController < ApplicationController

  before_action :set_banner, only: [:show, :edit, :update, :destroy]    
    
  # GET /banners
  # GET /banners.xml
  def index
    @header_tab = "banner"
    @banners = Banner.all
    render :layout => "admin"
  end

  # GET /banners/1
  # GET /banners/1.xml
  def show
    @header_tab = "banner"
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
    render :layout => "admin"
  end

  # POST /banners
  # POST /banners.xml
  def create
    @banner = Banner.new(banner_params)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to banners_path, :notice => 'Banner creado existosamente.' }
      else
        format.html { render :action => "new" }        
      end
    end
  end

  # PUT /banners/1
  # PUT /banners/1.xml
  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to banners_path, :notice => 'Banner actualizado existosamente.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.xml
  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to banners_path, :notice => 'Banner eliminado correctamente' }
      format.xml  { head :ok }
    end
  end  
  
  private
  
  def set_banner
      @banner = Banner.find(params[:id])
  end
  
  def banner_params
    params.require(:banner).permit(:title, :subtitle, :tour_id, :image)
  end  
  
end
