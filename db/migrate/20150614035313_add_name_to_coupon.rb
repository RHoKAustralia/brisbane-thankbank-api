class AddNameToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :name, :string
  end
end
