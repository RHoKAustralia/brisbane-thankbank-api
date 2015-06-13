require 'rails_helper'

RSpec.describe CouponCategory, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:valid_from) }
    it { is_expected.to validate_presence_of(:valid_to) }
    it { is_expected.to validate_presence_of(:partner_id) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_length_of(:quantity).is_at_least(1) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:partner) }
    it { is_expected.to have_many(:coupons) }
  end
end
