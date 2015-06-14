class PartnerSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url

  has_many :coupon_categories

  def image_url
    object.image.url(:thumb)
  end
end
