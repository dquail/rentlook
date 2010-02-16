class UnitsController < ApplicationController
  before_filter :authorize

  # GET /units
  # GET /units.xml
  def index
    @properties = []
    if (params[:property_id])
      @property = @user.properties.find(params[:property_id])
      @properties<<@property
      @units = @property.units
    else
      @user.properties.each{|property|@properties<<property}
      @units = @user.units
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @units }
      format.js do
        render :partial=>'unit', :collection=>@units
      end
    end
  end

  # GET /units/1
  # GET /units/1.xml
  def show
    @unit = Unit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unit }
    end
  end

  # GET /units/new
  # GET /units/new.xml
  def new
    @property = @user.properties.find(params[:property_id])
    @unit = @property.units.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unit }
    end
  end

  # GET /units/1/edit
  def edit
    @unit = Unit.find(params[:id])
  end

  # POST /units
  # POST /units.xml
  def create
    @property = @user.properties.find(params[:property_id])
    @unit = @property.units.new(params[:unit])
    @unit.statuses << Status.find_by_status('Vacant')
    respond_to do |format|
      if @unit.save
        flash[:notice] = 'Unit was successfully created.'
        format.html { redirect_to(@unit) }
        format.xml  { render :xml => @unit, :status => :created, :location => @unit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /units/1
  # PUT /units/1.xml
  def update
    @unit = Unit.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        flash[:notice] = 'Unit was successfully updated.'
        format.html { redirect_to(@unit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.xml
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to(units_url) }
      format.xml  { head :ok }
    end
  end

  def new_application
    @unit = Unit.find(params[:id])
    @application = @unit.applications.new()
    respond_to do |format|
      format.html # send_application.html.erb
      format.xml  { render :xml => @unit }
    end
  end
  
  def create_application
    @unit = Unit.find(params[:id])
    @application = @unit.applications.new(params[:application])
    @application.costs = ApplicationCosts.create(params[:application_costs])
    
    @applier = Tenant.new(params[:tenant])
    @tenant = Tenant.find_by_email(@applier.email)
    if @tenant
      @application.tenant = @tenant
    else
      @tenant = Tenant.create_with_perishable_token(@applier)
    end

    respond_to do |format|
      Tenant.transaction do
        @tenant.save
        @application.tenant=@tenant
        if @application.save
          #Send email to user with link to application
          flash[:notice] = 'Application was created successfully for user.'
          format.html { redirect_to @unit }
        else
          flash[:error] = 'Application error when creating'
          format.html { redirect_to @unit }
        end
      end
    end
  end
end
