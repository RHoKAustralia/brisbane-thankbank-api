require 'rails_helper'

RSpec.describe Partner, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:coupon_categories) }
  end
end
