class CreateEventPostbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :event_postbacks do |t|
      t.integer :referrer_id
      t.string :click_id
      t.string :event_title
      t.integer :event_id
      t.string :app_offer_id
      t.string :integer
      t.string :source_ip
      t.boolean :status
      t.boolean :duplicate
      t.boolean :paid,default: false
      t.string :event_amount
      t.string :pay_type

      t.timestamps
    end
  end
end
