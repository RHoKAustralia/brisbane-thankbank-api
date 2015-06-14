class Api::V1::CheckinsController < Api::BaseController
  def create
    checkin = Checkin.new(user: current_user, coupon: coupon)

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

  def image
    # @image ||= begin
    #  if params[:image].present?
    #
    #  else
    #
    #  end
   # end

  end

  def coupon
    @coupon ||= Coupon.create(partner: partner, user_id: current_user.id)
  end
end

