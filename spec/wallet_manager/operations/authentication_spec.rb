require 'rails_helper'

RSpec.describe WalletManager::Operations::Authentication do
  describe '#authenticate', vcr: { cassette_name: 'wallet_manager/authentication' } do
    it 'returns public keys' do
      response = described_class.new(network_url: '').authenticate
      public_key = response[:public_key]
      int_public_key = Base58.base58_to_int(public_key)
      expect(int_public_key).to be_an_instance_of(Integer)
    end

    it 'returns private keys' do
      response = described_class.new(network_url: '').authenticate
      private_key = response[:private_key]
      int_private_key = Base58.base58_to_int(private_key)
      expect(int_private_key).to be_an_instance_of(Integer)
    end
  end
end
