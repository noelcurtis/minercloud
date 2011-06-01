class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    stored_location_for(:user) || root_path # could be user_path(current_user.id)   if you want to redirect to the user page
  end

end
