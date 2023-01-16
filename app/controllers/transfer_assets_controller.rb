class TransferAssetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @assets = Asset.search_by_credentials_public_key(credentials.public_key)
  end

  def create
    @asset = Asset.find(params[:asset_id])
    TransferAssetService.call(@asset, amount_to_transfer: params[:amount],
                                      recipient_public_key: params[:recipient_public_key],
                                      network_url: current_user.network_url,
                                      credentials:)

    redirect_to root_path, notice: 'Ativo transferido com sucesso!'
  end

  private

  def credentials
    @credentials ||= Credential.find(params[:credentials_id])
  end
end
