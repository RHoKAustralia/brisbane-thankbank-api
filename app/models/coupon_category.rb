class CouponCategory < ActiveRecord::Base

  validates :name, :valid_from, :valid_to, :partner_id, presence: true
  validates :quantity, presence: true, length: { minimum: 1 }

  belongs_to :partner
end
