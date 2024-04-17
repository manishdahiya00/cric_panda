class AddReffOrderIdToReferrers < ActiveRecord::Migration[7.1]
  def change
    add_column :referrers, :ref_order_id, :string
  end
end
