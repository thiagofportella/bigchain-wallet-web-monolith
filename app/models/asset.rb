class Asset < ApplicationRecord
  belongs_to :user

  validates :bigchain_id, presence: true
  validates :bigchain_create_transaction_id, presence: true
  validates :bigchain_create_transaction_outputs, presence: true
end
