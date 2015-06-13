class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :token
      t.references :coupon_category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
