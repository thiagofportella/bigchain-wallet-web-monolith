module WalletManager
  module Operations
    class AssetInformation < Base
      def initialize(network_url:, bigchain_id:, credentials:, sandbox: !Rails.env.production?)
        super(network_url:, sandbox:)

        @credentials = credentials
        @bigchain_id = bigchain_id
      end

      def amount
        {
          amount: response_body['amount']
        }
      end

      private

      attr_reader :bigchain_id, :credentials

      def response_body
        @response_body ||= JSON.parse(response.body)
      end

      def response
        get("/asset/#{bigchain_id}", header_params:)
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
