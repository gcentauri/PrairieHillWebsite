class SessionsController < Devise::SessionsController
  protected

  def create
    render text: request.env['omniauth.auth'].to_yaml
  end
  
  def after_sign_in_path_for(resource)
    activities_path
    #events_path
  end

  def after_sign_out_path_for(resource)
    root_path
    #events_path
  end
  
end
