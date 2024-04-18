class AddFieldsToRefUser < ActiveRecord::Migration[7.1]
  def change
    change_table :ref_users, bulk: true do |t|
      t.string :provider
      t.string :uid
    end
  end
end
