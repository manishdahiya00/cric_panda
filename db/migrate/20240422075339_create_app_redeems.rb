class CreateAppRedeems < ActiveRecord::Migration[7.1]
  def change
    create_table :app_redeems do |t|
      t.integer :ref_user_id
      t.string :pay_phone
      t.string :pay_email
      t.string :pay_type
      t.string :pay_vendor
      t.string :upi_id
      t.string :pay_coin
      t.string :pay_amount
      t.string :status,default: "PENDING"

      t.timestamps
    end
  end
end
