class LandlordsController < ApplicationController
  # GET /landlords
  # GET /landlords.xml
  def index
    @landlords = Landlord.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @landlords }
    end
  end

  # GET /landlords/1
  # GET /landlords/1.xml
  def show
    @landlord = Landlord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @landlord }
    end
  end

  # GET /landlords/new
  # GET /landlords/new.xml
  def new
    @landlord = Landlord.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @landlord }
    end
  end

  # GET /landlords/1/edit
  def edit
    @landlord = Landlord.find(params[:id])
  end

  # POST /landlords
  # POST /landlords.xml
  def create
    @landlord = Landlord.new(params[:landlord])

    respond_to do |format|
      if @landlord.save
        flash[:notice] = 'Landlord was successfully created.'
        format.html { redirect_to(@landlord) }
        format.xml  { render :xml => @landlord, :status => :created, :location => @landlord }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @landlord.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /landlords/1
  # PUT /landlords/1.xml
  def update
    @landlord = Landlord.find(params[:id])

    respond_to do |format|
      if @landlord.update_attributes(params[:landlord])
        flash[:notice] = 'Landlord was successfully updated.'
        format.html { redirect_to(@landlord) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @landlord.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /landlords/1
  # DELETE /landlords/1.xml
  def destroy
    @landlord = Landlord.find(params[:id])
    @landlord.destroy

    respond_to do |format|
      format.html { redirect_to(landlords_url) }
      format.xml  { head :ok }
    end
  end
end
