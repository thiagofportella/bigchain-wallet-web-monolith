class CredentialsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @credential = @user.generate_credentials

    flash[:notice] = 'Credenciais geradas com sucesso!'
    redirect_to root_path
  end
end
