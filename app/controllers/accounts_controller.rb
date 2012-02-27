class AccountsController < ApplicationController
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
    @account = Account.find(params[:id])
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
    @account = Account.find(params[:id])
    render :layout => "admin"
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = Account.new(params[:account])

    respond_to do |format|
      if @account.save
        format.html { redirect_to(accounts_path, :notice => 'Account was successfully created.') }
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
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to(accounts_path, :notice => 'Account was successfully updated.') }
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
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
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
end
