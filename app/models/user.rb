class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

  has_many :credentials, dependent: :destroy

  attr_accessor :network_url

  def generate_credentials
    GenerateUserCredentials.call(self)
  end
end
