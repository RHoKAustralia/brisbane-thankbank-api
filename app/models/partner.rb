class Partner < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :coupon_categories

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
