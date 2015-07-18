class RegistrationsController < Devise::RegistrationsController
  protected

  def after_inactive_sign_up_path_for(resource)
    '/activities/index.html.erb'
  end

  def after_update_path_for(resource)
    '/activities/index.html.erb'
  end
end
