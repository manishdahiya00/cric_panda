class CreateAppOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :app_offers do |t|
      t.string :offer_name
      t.string :identifier
      t.text :description
      t.text :instructions
      t.string :payout_amount
      t.boolean :retention_offer,default: false
      t.string :retention_amount
      t.string :retention_day
      t.string :action_url
      t.string :refer_amount
      t.string :image_url
      t.integer :daily_cap
      t.boolean :status,default: false
      t.string :whatsapp_link
      t.boolean :event_offer,default: false
      t.integer :priority,default: 1
      t.boolean :insta_offer,default: false

      t.timestamps
    end
  end
end
