class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

  has_many :credentials, dependent: :nullify

  accepts_nested_attributes_for :credentials, reject_if: :all_blank

  def generate_credentials
    GenerateUserCredentials.call(self)
  end

  def available_public_keys
    credentials.map(&:public_key)
  end
end
