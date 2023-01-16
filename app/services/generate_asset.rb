class GenerateAsset
  def initialize(user:, credentials:, amount:, network_url: nil)
    @user = user
    @credentials = credentials
    @amount = amount
    @network_url = network_url.nil? ? user.network_url : network_url
  end

  def self.call(user:, credentials:, amount:, network_url:)
    new(user:, credentials:, amount:, network_url:).call
  end

  def call
    generate
  end

  private

  attr_reader :user, :credentials, :network_url, :amount

  def generate
    credentials.assets.create!(wallet_asset_creator)
  end

  def wallet_asset_creator
    WalletManager::Operations::AssetCreator.new(network_url:, credentials:, amount:).create
  end
end
