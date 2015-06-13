class AddAvatarToAdmins < ActiveRecord::Migration
  def up
    add_attachment :admins, :avatar
  end

  def down
    remove_attachment :admins, :avatar
  end
end
