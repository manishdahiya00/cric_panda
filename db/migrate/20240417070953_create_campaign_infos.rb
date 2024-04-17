class CreateCampaignInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :campaign_infos do |t|
      t.string :redirect_url
      t.string :title
      t.float :amount
      t.text :offer_steps
      t.text :terms_n_condition
      t.boolean :status
      t.string :identifier
      t.string :source
      t.string :publisher

      t.timestamps
    end
  end
end
