class Asset < ApplicationRecord
  has_and_belongs_to_many :credentials

  validates :bigchain_id, presence: true
  validates :bigchain_create_transaction_id, presence: true
  validates :bigchain_create_transaction_outputs, presence: true

  def self.search_by_credentials_public_key(pub_key)
    credential_id = Credential.find_by(public_key: pub_key).id

    Asset.joins(:assets_credentials).where(assets_credentials: { credential_id: })
  end
end
