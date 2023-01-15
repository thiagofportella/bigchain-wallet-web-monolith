class CredentialsController < ApplicationController
  before_action :authenticate_user!

  def create
    @credential = current_user.generate_credentials

    flash[:notice] = 'Credenciais geradas com sucesso!'
    redirect_to root_path
  end
end
