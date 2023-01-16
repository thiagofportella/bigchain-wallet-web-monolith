module WalletManager
  module Operations
    class AssetTransfer < Base
      def initialize(asset, network_url:, amount:, recipient_public_key:, credentials:, sandbox: !Rails.env.production?)
        super(network_url:, sandbox:)

        @asset = asset
        @amount = amount
        @recipient_public_key = recipient_public_key
        @credentials = credentials
      end

      def transfer
        {
          combined_created_transaction_id: response_body['combine_transaction_id'],
          total_amount_left: response_body['total_amount_left'],
          transfer_transaction_id: response_body['transfer_transaction_id']
        }
      end

      private

      attr_reader :asset, :amount, :recipient_public_key, :credentials

      def response_body
        @response_body ||= response.body
      end

      def response
        post("/asset/#{asset.bigchain_id}/transfer", header_params:, params: body_params)
      end

      def body_params
        { amount:, recipient_public_key: }
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
