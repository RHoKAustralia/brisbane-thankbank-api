class AddPartnerIdToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :partner_id, :integer
  end
end
