# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter { |c| Authorization.current_user = c.current_user }

helper_method :current_user


def current_user
  return @current_user if defined?(@current_user)
  @current_user = current_user_session && current_user_session.record
end

protected
def permission_denied
  flash[:notice] = "Sorry, you are not allowed to access that page."
  redirect_to login_url
end

def authorize
  if current_user_session
    @user = current_user
  else
    flash[:notice] = "Please login"
    redirect_to login_url
  end
end
def authorize_landlord
  if current_user_session
    @user = current_user
    if @user.class != Landlord
      flash[:notice] = "Please login as a landlord to view this resource."
      redirect_to login_url
    end
  else
    flash[:notice] = "Please login as a landlrod to view this resource"
    redirect_to login_url
  end
end
def authorize_tenant
  if current_user_session
    @user = current_user
    if @user.class != Tenant
      flash[:notice] = "Please login as a tenant to view this resource."
      redirect_to login_url
    end
  else
    flash[:notice] = "Please login as a tenant to view this resource."
    redirect_to login_url
  end
end
private

def current_user_session
  return @current_user_session if defined?(@current_user_session)
  @current_user_session = UserSession.find
end


end
