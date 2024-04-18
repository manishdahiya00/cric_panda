class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :click_id
      t.string :source_ip
      t.string :phone
      t.string :version_code
      t.string :version_name
      t.string :source
      t.string :mobile
      t.string :amount
      t.boolean :status,default: false
      t.integer :campaign_info_id

      t.timestamps
    end
  end
end
