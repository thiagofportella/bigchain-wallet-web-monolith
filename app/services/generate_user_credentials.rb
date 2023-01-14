class GenerateUserCredentials
  def initialize(user)
    @user = user
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    generate
  end

  private

  attr_reader :user

  def generate
    user.credentials.create!(wallet_authentication)
  end

  def wallet_authentication
    WalletManager::Operations::Authentication.new(network_url:).authenticate
  end

  def network_url
    @network_url ||= user.network_url
  end
end
