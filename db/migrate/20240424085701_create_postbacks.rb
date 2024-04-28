class CreatePostbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :postbacks do |t|
      t.integer "referrer_id"
      t.string "click_id"
      t.string "paytm_number"
      t.string "upi_id"

      t.timestamps
    end
  end
end
