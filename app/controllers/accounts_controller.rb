class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  
  # GET /accounts
  # GET /accounts.xml
  def index
    @header_tab = "account"
    @accounts = Account.all
    render :layout => "admin"
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @header_tab = "account"
    render :layout => "admin"
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @header_tab = "account"
    @account = Account.new
    render :layout => "admin"
  end

  # GET /accounts/1/edit
  def edit
    @header_tab = "account"
    render :layout => "admin"
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to(accounts_path, :notice => 'Cuenta creada correctamente') }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to(accounts_path, :notice => 'Cuenta actualizada correctamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Cuenta eliminada correctamente.' }
      format.xml  { head :ok }
    end
  end
  
  def login
    unless session[:account_id].nil?
      flash[:warn] = "Ya estas logueado"
      if session[:return_to] == nil
        redirect_to tours_path and return
      else
        redirect_to session[:return_to] and return
      end
    end

    if request.post?      
      account = Account.authenticate params[:email], params[:password]
      if account
        session[:account_id] = account.id
        logger.info "Account #{params[:email]} connected"
        logger.info "Return to #{session[:return_to]}"
        if session[:return_to] == nil   
          redirect_to tours_path and return
        else
          redirect_to session[:return_to] and return
        end
      else
        logger.warn "Account #{params[:email]} failed to login"
        flash.now[:error] = "Error al conectarse"
      end
    end
    render :layout => "login"
  end

  def logout
    logger.info "Account #{current_account.email} disconected"
    session[:account_id] = nil
    session[:return_to] = nil    
    redirect_to home_url
  end  
  
  private
  
  def set_account
    @account = Account.find(params[:id])
  end
  
    def account_params
      params.require(:account).permit(:name, :email, :password)
    end
end