class AssetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assets = current_user.assets
  end

  def show
    @amount = RetrieveAssetAmountJob.perform_now(params[:asset_id], credentials:, network_url:)
  end

  def create
    GenerateAsset.call(user: current_user, credentials:, amount: params[:amount],
                       network_url:)
    redirect_to root_path, notice: 'Ativo criado com sucesso!'
  end

  private

  def credentials
    @credentials ||= current_user.credentials.find(params[:credentials_id])
  end

  def network_url
    current_user.network_url
  end
end
