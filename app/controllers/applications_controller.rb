class ApplicationsController < ApplicationController
  before_filter :authorize
  
  # GET /applications
  # GET /applications.xml
  def index
    find_unit

    @applications = @unit.applications

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @applications }
    end
  end

  # GET /applications/1
  # GET /applications/1.xml
  def show
    @application = Application.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @application }
    end
  end

  # GET /applications/new
  # GET /applications/new.xml
  def new
    find_unit
    @application = @unit.applications.new
    if @user.class == Tenant
      @application.tenant = @user
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @application }
    end
  end

  # GET /applications/1/edit
  def edit
    @application = Application.find(params[:id])
  end

  # POST /applications
  # POST /applications.xml
  def create
    find_unit
    @application = @unit.applications.new(params[:application])

    @application.costs = ApplicationCosts.create(params[:application_costs])
    @application.bank_info = ApplicationBankInfo.create(params[:application_bank_info])
    @application.credit_info = ApplicationCreditInfo.create(params[:application_credit_info])
    @application.employment_history = EmploymentHistory.create(params[:employment_history])
    @application.income = Income.create(params[:income])
    @application.rental_history = RentalHistory.create(params[:rental_history])



    respond_to do |format|
      if @application.save
        flash[:notice] = 'Application was successfully created.'
        format.html { redirect_to(@application) }
        format.xml  { render :xml => @application, :status => :created, :location => @application }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /applications/1
  # PUT /applications/1.xml
  def update
    @application = Application.find(params[:id])
    @application.costs = ApplicationCosts.create(params[:application_costs])
    @application.bank_info = ApplicationBankInfo.create(params[:application_bank_info])
    @application.credit_info = ApplicationCreditInfo.create(params[:application_credit_info])
    @application.employment_history = EmploymentHistory.create(params[:employment_history])
    @application.income = Income.create(params[:income])
    @application.rental_history = RentalHistory.create(params[:rental_history])
    if @user.class == Tenant
      @application.tenant = @user
    end

    respond_to do |format|
      if @application.update_attributes(params[:application])
        if @application.save
          flash[:notice] = 'Application was successfully updated.'
          format.html { redirect_to(@application) }
          format.xml  { head :ok }
        else
          flash[:error] = 'Application failed to update.'
          format.html { render :action => "edit" }
          format.xml  { render :xml => @application.errors, :status => :unprocessable_entity }
        end
      else
        flash[:error] = 'Application failed to update.'
        format.html { render :action => "edit" }
        format.xml  { render :xml => @application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.xml
  def destroy
    @application = Application.find(params[:id])
    @unit = @application.unit
    @application.destroy

    respond_to do |format|
      format.html { redirect_to(unit_applications_url(@unit)) }
      format.xml  { head :ok }
    end
  end

  # PUT /applications/1/approve
  def approve
    @application = Application.find(params[:id])
    @application.status = 'A'
    @lease = Lease.new()
    @lease.unit = @application.unit
    @lease.start_date = @application.start_date
    @lease.end_date = @application.end_date
    @lease.tenant = @application.tenant
    if current_user.class==Landlord
      @lease.landlord_approved=true
    elsif current_user.class==Tenant
      @lease.tennant_approved=true
    end

    respond_to do |format|
      Lease.transaction do
        if @application.save
          if @lease.save
            if current_user.class==Landlord
              AccountMailer.deliver_lease_for_unit(@lease.tenant, current_user, @lease)
            elsif current_user.class==Tenant
              AccountMailer.deliver_lease_for_unit(@lease.unit.property.landlord, current_user, @lease)
            end
            flash[:notice] = 'Application was successfully approved.'
            format.html { redirect_to(@lease.unit) }
            format.xml  { head :ok }
          else
            flash[:notice] = 'Error generating the lease for the application.'
            format.html { render :controller=>"leases", :action => "edit" }
          end
        else
          flash[:notice] = 'Error approving the application
          format.html { redirect_to(@application) }'
        end
      end
    end
  end
  # PUT /applications/1/reject
  def reject
    @application = Application.find(params[:id])
    @application.status = 'R'
    respond_to do |format|
      if @application.save
        flash[:notice] = 'Application was successfully rejected.'
        format.html { redirect_to(@application) }
        format.xml  { head :ok }
      else
        flash[:notice] = 'Error approving the application
        format.html { redirect_to(@application) }'
      end
    end
  end

private
  def find_unit
    @unit = Unit.find(params[:unit_id])
  end

end
