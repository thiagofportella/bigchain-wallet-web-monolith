class Credential < ApplicationRecord
  belongs_to :user, optional: true

  validates :public_key, presence: true
  validates :private_key, presence: true, on: :update

  has_and_belongs_to_many :assets
end
