class Partner < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :coupon_categories
end
