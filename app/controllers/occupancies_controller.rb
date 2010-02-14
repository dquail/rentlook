class OccupanciesController < ApplicationController
  before_filter :authorize
  # GET /occupancies
  # GET /occupancies.xml
  def index
    @unit = Unit.find(params[:unit_id])
    @occupancies = @unit.occupancies.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occupancies }
    end
  end

  # GET /occupancies/1
  # GET /occupancies/1.xml
  def show
    @occupancy = Occupancy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @occupancy }
    end
  end

  # GET /occupancies/new
  # GET /occupancies/new.xml
  def new
    @unit = Unit.find(params[:unit_id])
    @occupancies = @unit.occupancies.all
    @occupancy = Occupancy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @occupancy }
    end
  end

  # GET /occupancies/1/edit
  def edit
    @occupancy = Occupancy.find(params[:id])
  end

  # POST /occupancies
  # POST /occupancies.xml
  def create
    @occupancy = Occupancy.new(params[:occupancy])
    @u = Tenant.new(params[:tenant])
    @tenant = Tenant.create_with_perishable_token(@u)
    @unit=Unit.find(params[:unit_id].to_i)

    respond_to do |format|
      Tenant.transaction do
        @tenant.save
        @occupancy.tenant=@tenant
        @occupancy.unit =@unit
        if @occupancy.save
          flash[:notice] = 'Occupancy was successfully created with the tenant.'
          format.html { redirect_to @unit }
          format.xml  { render :xml => @occupancy, :status => :created, :location => @occupancy }
        else
          format.html { redirect_to new_unit_occupancy_url(@occupancy.unit) }
          format.xml  { render :xml => @occupancy.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /occupancies/1
  # PUT /occupancies/1.xml
  def update
    @occupancy = Occupancy.find(params[:id])

    respond_to do |format|
      if @occupancy.update_attributes(params[:occupancy])
        flash[:notice] = 'Occupancy was successfully updated.'
        format.html { redirect_to(@occupancy) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @occupancy.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /occupancies/1
  # DELETE /occupancies/1.xml
  def destroy
    @occupancy = Occupancy.find(params[:id])
    @occupancy.destroy

    respond_to do |format|
      format.html { redirect_to(occupancies_url) }
      format.xml  { head :ok }
    end
  end
end
