class Coupon < ActiveRecord::Base
  belongs_to :coupon_category
  belongs_to :user

  validates :coupon_category_id, :user_id, presence: true
  validates :token, uniqueness: true, presence: true

  before_validation :generate_unique_token

  private

  def generate_unique_token
    Digest::SHA1.hexdigest([Time.now, self.attributes.to_s].join) unless self.token.present?
  end
end
