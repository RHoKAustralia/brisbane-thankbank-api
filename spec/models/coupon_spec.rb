require 'rails_helper'

RSpec.describe Coupon, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_uniqueness_of(:token) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:partner) }
    it { is_expected.to belong_to(:user) }
  end
end
