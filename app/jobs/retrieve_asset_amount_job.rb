class RetrieveAssetAmountJob < ApplicationJob
  queue_as :default

  def perform(bigchain_asset_id, credentials:, network_url:)
    RetrieveAssetAmountService.call(bigchain_asset_id:, credentials:, network_url:)
  end
end
