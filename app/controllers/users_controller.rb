class UsersController < ApplicationController
  before_filter :authorize, :except => [:new, :create]
  # GET /users/new
  # GET /users/new.xml
  def new
    @user_session = UserSession.find
    if !@user_session.nil? 
      @user_session.destroy
    end
    
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
    if !@user
      flash[:notice] = 'You must first login'
      redirect_to account_url
    end
  end

  # GET /users/1/
  def show
    @user = current_user
    if !@user
      flash[:notice] = 'You must first login'
      redirect_to login_url
    elsif @user.class == 'Landlord'
      redirect_to landlord_url(@user)
    elsif @user.class == 'Tenant'
      puts "We have a Tenant"
      #redirect_to tenant_url(@user)
      redirect_to login_url
    end
  end


  # POST /users
  # POST /users.xml
  def create
  user=params[:user]
    if user[:type] == 'Landlord'
      @user = Landlord.new(params[:user])
    elsif user[:type] == 'Tenant'
      @user = Tenant.new(params[:user])
    end

    respond_to do |format|
      if @user.save
        flash[:notice] = "Thanks for signing up, we've delivered an email to you with instructions on how to complete your registration!"
        @user.deliver_verification_instructions!
        redirect_to "index.html"

        format.html { redirect_to account_url }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
      

    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Successfully updated profile.'
        format.html { redirect_to account_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
