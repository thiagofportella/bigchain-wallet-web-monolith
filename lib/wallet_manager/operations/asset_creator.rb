module WalletManager
  module Operations
    class AssetCreator < Base
      def initialize(network_url:, credentials:, amount: 1, sandbox: !Rails.env.production?)
        super(network_url:, sandbox:)
        @credentials = credentials
        @amount = amount
      end

      def create
        {
          asset_id: response_body['asset_id'],
          create_transaction_id: response_body['create_transaction_id'],
          create_transaction_outputs: response_body['create_transaction_outputs']
        }
      end

      private

      attr_reader :credentials, :amount

      def response_body
        @response_body ||= response.body
      end

      def response
        post('/asset', header_params:, params: body_params)
      end

      def body_params
        { amount: }
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
