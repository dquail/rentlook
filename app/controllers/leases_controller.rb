class LeasesController < ApplicationController
  before_filter :authorize
  
  # GET /unit/1/leases
  # GET /unit/1/leases.xml
  def index
    if (params[:unit_id])
      @unit = Unit.find(params[:unit_id])
      @leases = @unit.leases.all
    else
      @leases = []
      if @user.class == Landlord
        @user.properties.each do |property|
          property.units.each do |unit|
            unit.leases.each do|lease|
              @leases<<lease
            end
          end
        end
      elsif @user.class == Tenant
        @leases = @user.leases
      end

    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @leases }
    end
  end

  # GET /leases/1
  # GET /leases/1.xml
  def show
    @lease = Lease.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lease }
      format.js {render :partial => @lease}
    end
  end

  # GET unit/1/leases/new
  # GET unit/1/leases/new.xml
  def new
    @unit = Unit.find(params[:unit_id])
    @lease = @unit.leases.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lease }
    end
  end

  # GET leases/1/edit
  def edit
    @lease = Lease.find(params[:id])
    if @lease.tenant_approved && @lease.landlord_approved
        flash[:notice] = 'Lease has already been accepted by both landlord and tenant.  You can not edit.'
        respond_to do |format|
          format.html {redirect_to(@lease)}
          format.xml { render :xml => @lease}
        end
    end
  end

  # POST /unit/1/leases
  # POST /unit/1/leases.xml
  def create
    @unit = Unit.find(params[:unit_id])
    @lease = @unit.leases.new(params[:lease])

    respond_to do |format|
      if @lease.save
        flash[:notice] = 'Lease was successfully created.'
        format.html { redirect_to(@lease) }
        format.xml  { render :xml => @lease, :status => :created, :location => @lease }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lease.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leases/1
  # PUT /leases/1.xml
  def update
    @lease = Lease.find(params[:id])

    respond_to do |format|
      if @lease.update_attributes(params[:lease])
        if @lease.landlord_approved && @lease.tenant_approved
          @lease.unit.update_attribute(:rented, true)
        end
        if current_user==Tenant
          @lease.deliver_lease_update_for_unit(@lease.unit.property.landlord, current_user)
        else
          @lease.deliver_lease_update_for_unit(@lease.tenant, current_user)
        end

        flash[:notice] = 'Lease was successfully updated.'
        format.html { redirect_to(@lease) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lease.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leases/1
  # DELETE /leases/1.xml
  def destroy
    @lease = Lease.find(params[:id])
    @lease.destroy

    respond_to do |format|
      format.html { redirect_to(leases_url) }
      format.xml  { head :ok }
    end
  end
end
