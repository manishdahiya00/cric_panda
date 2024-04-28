class RemoveColumnIntegerFromEventPostback < ActiveRecord::Migration[7.1]
  def change
    remove_column :event_postbacks ,:integer
  end
end
