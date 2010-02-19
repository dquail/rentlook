class LandlordsController < ApplicationController
  before_filter :authorize, :except => [:new, :create]
  # GET /users/new
  # GET /users/new.xml
  def new
    @user_session = UserSession.find
    if !@user.nil? 
      @user_session.destroy
    end

    @landlord = Landlord.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @landlord }
    end
  end

  # GET /landlords/1/edit
  def edit
    @landlord = current_user
    if !@landlord
      flash[:notice] = 'You must first login'
      redirect_to account_url
    end
  end

  # GET /landlords/1/
  def show
    @landlord = current_user
    if !@landlord
      flash[:notice] = 'You must first login'
      redirect_to login_url
    end
  end


  # POST /landlords
  # POST /landlords.xml
  def create

    @landlord = Landlord.new(params[:landlord])

    respond_to do |format|
      if @landlord.save
        flash[:notice] = 'Landlord registration successful.'
        format.html { redirect_to signin_url }
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
    @landlord = current_user

    respond_to do |format|
      if @landlord.update_attributes(params[:landlord])
        flash[:notice] = 'Successfully updated profile.'
        format.html { redirect_to account_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @landlord.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /landlordss/1
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
