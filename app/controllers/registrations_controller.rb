class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    activities_path
  end
  
  def after_inactive_sign_up_path_for(resource)
    activities_path
  end

  def after_update_path_for(resource)
    activities_path
  end
end
