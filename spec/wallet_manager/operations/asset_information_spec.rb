require 'rails_helper'

RSpec.describe WalletManager::Operations::AssetInformation do
  describe '#amount', vcr: { cassette_name: 'wallet_manager/operations/asset_information' } do
    it 'returns asset amount' do
      network_url = Rails.application.credentials.default_bigchain_network_url
      asset = instance_double(Asset,
                              bigchain_id: '915b03f4bb139004ef7bf5e7784a81262ca858142bc99fe88bd42ad6ea390311')
      credentials = instance_double(Credential,
                                    public_key: 'AuVTSSLZpi4pbQmUZN1Zx41EuRNLiQ3UWgeiHxY2CfPv',
                                    private_key: '2N3adpwMwWLss3i4xfVKK4Jq1EDPXXNTSMjBNnkH7Pqy')

      response = described_class.new(network_url:, bigchain_id: asset.bigchain_id, credentials:).amount
      expect(response[:amount].scan(/\D/).empty?).to be_truthy
    end
  end
end
