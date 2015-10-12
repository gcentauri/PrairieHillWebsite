class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    #activities_path
    events_path
  end

  def after_sign_out_path_for(resource)
    events_path
  end
  
end
