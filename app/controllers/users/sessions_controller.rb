class Users::SessionsController < Devise::SessionsController
  def create
    super
    current_user.update!(network_url: params[:user][:network_url])
  end
end
