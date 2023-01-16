module WalletManager
  module Operations
    class NftCreator < Base
      def initialize(network_url:, credentials:, data:, sandbox: !Rails.env.production?)
        super(network_url:, sandbox:)
        @credentials = credentials
        @data = data
      end

      def create
        {
          bigchain_id: response_body['asset_id'],
          bigchain_create_transaction_id: response_body['create_transaction_id'],
          bigchain_create_transaction_outputs: response_body['create_transaction_outputs']
        }
      end

      private

      attr_reader :credentials, :data

      def response_body
        @response_body ||= JSON.parse(response.body)
      end

      def response
        post('/asset', header_params:, params: body_params)
      end

      def body_params
        {
          amount: 1,
          nft: nft_data
        }
      end

      def nft_data
        nft_data = {}
        nft_data['data'] = { asset: data }

        nft_data
      end

      def header_params
        {
          'Public-Key' => credentials.public_key,
          'Private-Key' => credentials.private_key
        }
      end
    end
  end
end
