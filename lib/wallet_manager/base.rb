module WalletManager
  class Base
    def initialize(network_url:, sandbox: !Rails.env.production?)
      @network_url = network_url
      @sandbox = sandbox
    end

    def base_url
      return 'http://localhost:8884' if sandbox

      Rails.application.credentials[:bigchain_wallet_api_url]
    end

    def get(resource, header_params: nil)
      HTTParty.get(
        build_url(resource),
        headers: request_headers(header_params),
        timeout:
      )
    end

    def post(resource, header_params: nil, params: nil)
      HTTParty.post(
        build_url(resource),
        headers: request_headers(header_params),
        body: body(params),
        timeout:
      )
    end

    private

    attr_reader :sandbox, :network_url

    def build_url(path)
      "#{base_url}#{path}"
    end

    def request_headers(params)
      params.nil? ? headers : headers.merge!(params)
    end

    def headers
      {
        'Network-Url' => network_url,
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }
    end

    def timeout
      return 20 if sandbox

      10
    end

    def body(params)
      return if params.nil?

      params.to_json
    end
  end
end
