class TransferAssetService
  def initialize(asset, amount_to_transfer:, recipient_public_key:, network_url:, credentials:)
    @asset = asset
    @amount_to_transfer = amount_to_transfer
    @recipient_public_key = recipient_public_key
    @network_url = network_url
    @credentials = credentials
  end

  def self.call(asset, amount_to_transfer:, recipient_public_key:, network_url:, credentials:)
    new(asset, amount_to_transfer:, recipient_public_key:, network_url:, credentials:).call
  end

  def call
    transfer
    asset.credentials << Credential.create(public_key: recipient_public_key)
  end

  private

  attr_reader :asset, :amount_to_transfer, :recipient_public_key, :network_url, :credentials

  def transfer
    wallet_manager_transfer[:total_amount_left]
  end

  def wallet_manager_transfer
    WalletManager::Operations::AssetTransfer.new(asset, network_url:, amount: amount_to_transfer.to_i,
                                                        recipient_public_key:,
                                                        credentials:).transfer
  end
end
