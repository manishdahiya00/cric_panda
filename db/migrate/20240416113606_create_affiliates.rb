class CreateAffiliates < ActiveRecord::Migration[7.1]
  def change
    create_table :affiliates do |t|
      t.string :paytm_number
      t.string :campaign_name
      t.string :referral_code

      t.timestamps
    end
  end
end
