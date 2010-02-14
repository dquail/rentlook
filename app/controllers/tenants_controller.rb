class TenantsController < ApplicationController
  before_filter :authorize, :except => [:new, :create]
  # GET /tenants/new
  # GET /tenants/new.xml
  def new
    @user_session = UserSession.find
    if !@user.nil?
      @user_session.destroy
    end

    @tenant = Tenant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tenant }
    end
  end

  # GET /tenantss/1/edit
  def edit
    @tenant = current_user
    if !@tenant
      flash[:notice] = 'You must first login'
      redirect_to account_url
    end
  end

  # GET /tenants/1/
  def show
    @tenant = current_user
    if !@tenant
      flash[:notice] = 'You must first login'
      redirect_to login_url
    end
  end


  # POST /tenants
  # POST /tenants.xml
  def create

    @tenant = Tenant.new(params[:tenant])

    respond_to do |format|
      if @tenant.save
        flash[:notice] = 'Tenant registration successful.'
        format.html { redirect_to account_url }
        format.xml  { render :xml => @tenant, :status => :created, :location => @tenant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tenant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tenants/1
  # PUT /tenants/1.xml
  def update
    @tenant = current_user

    respond_to do |format|
      if @tenant.update_attributes(params[:tenant])
        flash[:notice] = 'Successfully updated profile.'
        format.html { redirect_to account_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tenant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tenants/1
  # DELETE /tenants/1.xml
  def destroy
    @tenant = Tenant.find(params[:id])
    @tenant.destroy

    respond_to do |format|
      format.html { redirect_to(tenants_url) }
      format.xml  { head :ok }
    end
  end
end
