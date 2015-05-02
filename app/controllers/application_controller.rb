require "application_responder"


class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery
  skip_before_action :verify_authenticity_token, if: :json_request?

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_contacts

  def set_contacts
    @contact = Contact.new
  end

  def after_sign_in_path_for(resource)
    ccf_path
  end

  def after_sign_out_path_for(resource)
    ccf_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :first_name, :last_name, :phone, :username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :username, :email, :password, :password_confirmation, :current_password, :phone, :first_name, :last_name, :admin) }
  end

  def json_request?
    request.format.json?
  end
end
