class RetrieveAssetAmountService
  def initialize(bigchain_asset_id:, credentials:, network_url:)
    @bigchain_asset_id = bigchain_asset_id
    @credentials = credentials
    @network_url = network_url
  end

  def self.call(bigchain_asset_id:, credentials:, network_url:)
    new(bigchain_asset_id:, credentials:, network_url:).call
  end

  def call
    retrieve
  end

  private

  attr_reader :bigchain_asset_id, :credentials, :network_url

  def retrieve
    wallet_asset_amount['amount']
  end

  def wallet_asset_amount
    WalletManager::Operations::AssetInformation.new(network_url:, bigchain_id: bigchain_asset_id, credentials:)
                                               .amount
  end
end
