class PropertiesController < ApplicationController
  filter_resource_access
  before_filter :authorize_landlord

  # GET /properties
  # GET /properties.xml
  def index
    @properties = @user.properties.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @properties }
    end
  end

  # GET /properties/1
  # GET /properties/1.xml
  def show
    #@property = Property.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @property }
    end
  end

  # GET /properties/new
  # GET /properties/new.xml
  def new
    @property = @user.properties.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @property }
    end
  end

  # GET /properties/1/edit
  def edit
    #@property = Property.find(params[:id])
  end

  # POST /properties
  # POST /properties.xml
  def create
    @property = @user.properties.new(params[:property])
    @number_of_units = params[:number_of_units].to_i
    
    respond_to do |format|
      if @property.save
        @number_of_units.times do |unit|
          @property.units.build(:name => unit.to_s, :bedrooms=>1, :bathrooms=>1, :square_feet => 1000, :base_rent=>1000)
        end
        if (@property.save)
          flash[:notice] = 'Property and units created!'
        else
          flash[:notice] = 'Property creted, but errors creating units.'
        end
        format.html { redirect_to(@property) }
        format.xml  { render :xml => @property, :status => :created, :location => @property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /properties/1
  # PUT /properties/1.xml
  def update
    #@property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        flash[:notice] = 'Property was successfully updated.'
        format.html { redirect_to(@property) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.xml
  def destroy
    #@property = Property.find(params[:id])
    @property.destroy

    respond_to do |format|
      format.html { redirect_to(properties_url) }
      format.xml  { head :ok }
    end
  end

private


end
