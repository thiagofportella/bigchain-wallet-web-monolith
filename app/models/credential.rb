class Credential < ApplicationRecord
  validates :public_key, presence: true
  validates :private_key, presence: true
end
