require 'rails_helper'

RSpec.describe WalletManager::Operations::AssetCreator do
  describe '#create', vcr: { cassette_name: 'wallet_manager/operations/asset_creator' } do
    it 'returns recently created asset id' do
      network_url = Rails.application.credentials.default_bigchain_network_url
      credentials = instance_double(Credential,
                                    public_key: 'AuVTSSLZpi4pbQmUZN1Zx41EuRNLiQ3UWgeiHxY2CfPv',
                                    private_key: '2N3adpwMwWLss3i4xfVKK4Jq1EDPXXNTSMjBNnkH7Pqy')

      response = described_class.new(network_url:, credentials:).create
      expect(response[:asset_id]).to be_an_instance_of(String)
    end
  end
end
