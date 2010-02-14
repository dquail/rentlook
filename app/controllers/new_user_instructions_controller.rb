class NewUserInstructionsController < ApplicationController
  before_filter :authorize, :only =>[:new, :create]
  before_filter :load_user_using_perishable_token, :only =>[:show, :update]

  def show
    render
  end

  def update
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      @user.verify!
      flash[:notice] = "Account created"
      redirect_to "index.html"
    else
      render :action => :edit
    end
  end

  def new
    @new_user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def create
    user=params[:user]

    if user[:type] == 'Landlord'
      @new_user = Landlord.create_with_perishable_token(user)
    elsif user[:type] == 'Tenant'
      @new_user = Tenant.create_with_perishable_token(user)
    end

    if @new_user.save
      @new_user.deliver_new_user_instructions!(@user)
      flash[:notice] = "Instructions have been sent to " +
        "the user you invited.  They'll be able to sign up now."
      redirect_to account_url
    else
      flash[:notice] = "That user already has been invited."
      render :action =>new
    end
  end

private
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:notice] = "We're sorry but we could not locate your account." +
        'If you are having issues try copying and pasting the URL ' +
        'from your email into your browser or restarting the ' +
        'reset password process.'
      redirect_to account_url
    end
  end

end
