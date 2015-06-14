class Api::V1::CheckinsController < Api::BaseController
  def create
    checkin = Checkin.new(user: current_user, coupon: coupon, image: image)
    if params[:image].present?
      StringIO.open(Base64.decode64(params[:image])) do |data|
        data.class.class_eval { attr_accessor :original_filename, :content_type }
        data.original_filename = "file-#{Random.rand(123321)}.jpg"
        data.content_type = "image/jpeg"
        checkin.image = data
      end
    end

    if checkin.save
      render json: { checkin: { id: checkin.id }, code: 200 }.to_json, status: :ok
    else
      render json: { message: checkin.errors.full_messages.join(' '), code: 422 }.to_json, status: 422
    end
  end

  private

  def partner
    @partner ||= begin
      Partner.find_or_create_by(name: params[:coupon][:partner][:name])
    end
  end

  def coupon
    @coupon ||= Coupon.create(partner: partner, user_id: current_user.id, name: params[:coupon][:name])
  end
end

