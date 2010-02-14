class RentApplicationsController < ApplicationController
  # GET /rent_applications
  # GET /rent_applications.xml
  def index
    @rent_applications = RentApplication.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rent_applications }
    end
  end

  # GET /rent_applications/1
  # GET /rent_applications/1.xml
  def show
    @rent_application = RentApplication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rent_application }
    end
  end

  # GET /rent_applications/new
  # GET /rent_applications/new.xml
  def new
    @rent_application = RentApplication.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rent_application }
    end
  end

  # GET /rent_applications/1/edit
  def edit
    @rent_application = RentApplication.find(params[:id])
  end

  # POST /rent_applications
  # POST /rent_applications.xml
  def create
    @rent_application = RentApplication.new(params[:rent_application])

    respond_to do |format|
      if @rent_application.save
        flash[:notice] = 'RentApplication was successfully created.'
        format.html { redirect_to(@rent_application) }
        format.xml  { render :xml => @rent_application, :status => :created, :location => @rent_application }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rent_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rent_applications/1
  # PUT /rent_applications/1.xml
  def update
    @rent_application = RentApplication.find(params[:id])

    respond_to do |format|
      if @rent_application.update_attributes(params[:rent_application])
        flash[:notice] = 'RentApplication was successfully updated.'
        format.html { redirect_to(@rent_application) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rent_application.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rent_applications/1
  # DELETE /rent_applications/1.xml
  def destroy
    @rent_application = RentApplication.find(params[:id])
    @rent_application.destroy

    respond_to do |format|
      format.html { redirect_to(rent_applications_url) }
      format.xml  { head :ok }
    end
  end
end
