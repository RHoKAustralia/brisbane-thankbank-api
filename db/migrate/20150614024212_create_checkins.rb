class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :user, index: true, foreign_key: true
      t.references :coupon, index: true, foreign_key: true
      t.boolean :approved, default: false
      t.attachment :image

      t.timestamps null: false
    end
  end
end
