class AddImageToPartners < ActiveRecord::Migration
  def up
    add_attachment :partners, :image
  end

  def down
    remove_attachment :partners, :image
  end
end
