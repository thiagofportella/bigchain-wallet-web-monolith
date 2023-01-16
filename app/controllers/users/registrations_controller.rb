class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_sign_up_params, only: :create

  def create
    super
    current_user.update!(network_url: Rails.application.credentials.default_bigchain_network_url)
  end

  private

  def configure_permitted_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, { credentials_attributes: %i[public_key private_key] }])
  end
end
