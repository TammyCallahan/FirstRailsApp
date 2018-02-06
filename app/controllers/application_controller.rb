class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Redirect and flash notice when user accessing areas not allowed
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end
end
