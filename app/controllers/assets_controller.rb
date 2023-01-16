class AssetsController < ApplicationController
  respond_to :json, :html

  before_action :authenticate_user!

  def index
    @credentials_id = credentials.id
    @assets = Asset.search_by_credentials_public_key(credentials.public_key)
  end

  def show
    @amount = RetrieveAssetAmountJob.perform_now(params[:asset_id], credentials:, network_url:)

    respond_to do |format|
      format.json { render json: { bigchain_id: params[:asset_id], amount: @amount } }
    end
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
