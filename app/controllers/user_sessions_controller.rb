class UserSessionsController < ApplicationController
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if (@user_session.save)
      user = current_user
      if user.class ==Tenant
        redirect_to applications_url
      elsif user.class == Landlord
        redirect_to properties_url
      end
    else
      render :action => 'new'
    end
  end
  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    respond_to do |format|
      format.html { redirect_to root_url }
      format.xml  { head :ok }
    end
  end
end
