class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :app_offer_id
      t.string :event_title
      t.string :event_amount
      t.string :pay_type
      t.integer :event_order,default: 1

      t.timestamps
    end
  end
end
