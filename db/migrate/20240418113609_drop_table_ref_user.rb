class DropTableRefUser < ActiveRecord::Migration[7.1]
  def change
    drop_table :ref_users
  end
end
