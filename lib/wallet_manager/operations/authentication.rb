module WalletManager
  module Operations
    class Authentication < Base
      def authenticate
        {
          public_key: response_body['public_key'],
          private_key: response.headers['Private-Key']
        }
      end

      private

      attr_reader :user

      def response_body
        JSON.parse(response.body)
      end

      def response
        @response ||= post('/signup')
      end
    end
  end
end
