require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  context 'Associations' do
    it { is_expected.to have_many(:coupons) }
  end
end
