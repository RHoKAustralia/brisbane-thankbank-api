class CreateCouponCategories < ActiveRecord::Migration
  def change
    create_table :coupon_categories do |t|
      t.datetime :valid_from
      t.datetime :valid_to
      t.integer :quantity
      t.string :name
      t.text :description
      t.references :partner

      t.timestamps null: false
    end
  end
end
