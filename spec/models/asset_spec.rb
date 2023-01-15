require 'rails_helper'

RSpec.describe Asset, type: :model do
  it { is_expected.to validate_presence_of(:bigchain_id) }
  it { is_expected.to validate_presence_of(:bigchain_create_transaction_id) }
  it { is_expected.to validate_presence_of(:bigchain_create_transaction_outputs) }
end
