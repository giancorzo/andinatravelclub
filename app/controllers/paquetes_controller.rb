class PaquetesController < ApplicationController
  # GET /paquetes
  # GET /paquetes.xml
  def index
    @paquetes = Paquete.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paquetes }
    end
  end

  # GET /paquetes/1
  # GET /paquetes/1.xml
  def show
    @paquete = Paquete.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @paquete }
    end
  end

  # GET /paquetes/new
  # GET /paquetes/new.xml
  def new
    @paquete = Paquete.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @paquete }
    end
  end

  # GET /paquetes/1/edit
  def edit
    @paquete = Paquete.find(params[:id])
  end

  # POST /paquetes
  # POST /paquetes.xml
  def create
    @paquete = Paquete.new(params[:paquete])

    respond_to do |format|
      if @paquete.save
        format.html { redirect_to(@paquete, :notice => 'Paquete was successfully created.') }
        format.xml  { render :xml => @paquete, :status => :created, :location => @paquete }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @paquete.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /paquetes/1
  # PUT /paquetes/1.xml
  def update
    @paquete = Paquete.find(params[:id])

    respond_to do |format|
      if @paquete.update_attributes(params[:paquete])
        format.html { redirect_to(@paquete, :notice => 'Paquete was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paquete.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /paquetes/1
  # DELETE /paquetes/1.xml
  def destroy
    @paquete = Paquete.find(params[:id])
    @paquete.destroy

    respond_to do |format|
      format.html { redirect_to(paquetes_url) }
      format.xml  { head :ok }
    end
  end
end
