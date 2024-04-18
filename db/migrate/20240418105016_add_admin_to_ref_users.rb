class AddAdminToRefUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :ref_users, :admin, :boolean,default: false
  end
end
