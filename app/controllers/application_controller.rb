class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?

  private

  def configure_permitted_params
    devise_parameter_sanitizer.permit :sign_up, keys: %i[name network_url]
  end
end
