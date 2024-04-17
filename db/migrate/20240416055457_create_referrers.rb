class CreateReferrers < ActiveRecord::Migration[7.1]
  def change
    create_table :referrers do |t|
      t.integer :affiliate_id
      t.string :paytm_number
      t.string :source_ip
      t.string :click_id
      t.integer :live_offer_id
      t.integer :app_offer_id
      t.boolean :aff_status,default: false
      t.boolean :ref_status,default: false
      t.string :aff_order_id
      t.text :aff_pay_response
      t.text :ref_pay_response
      t.string :upi_id
      t.string :telegram_id

      t.timestamps
    end
  end
end
