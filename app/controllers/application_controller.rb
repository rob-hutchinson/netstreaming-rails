class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :hardcode_json_format, unless: :devise_controller?
 
  before_action :authenticate_user!, except: [:index]
 
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to ("/"), alert: exception.message
  end

  check_authorization unless: :devise_controller?


private

  def hardcode_json_format
    request.format = :json
  end
end
