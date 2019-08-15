class ApplicationController < ActionController::Base
  def current_chef
    # Only available if a successful login occurred
    logger.debug "Current user is #{@chef.id}" if @chef
    logger.debug "Session Chef_id is #{session[:chef_id]}" if session[:chef_id]
    @current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def logged_out?
    current_chef.nil?
  end

  def logout
    session[:chef_id] = nil
    @current_chef = nil
  end

  def require_authenticated_user
    return unless logged_out?

    flash[:danger] = 'You must be logged in to perform that action'
    redirect_to root_path
  end
end
