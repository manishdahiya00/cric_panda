class CreateGameRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :game_rewards do |t|
      t.string :player_id
      t.integer :game_award_id
      t.boolean :status,default:false
      t.string :click_id
      t.string :source_ip
      t.string :source

      t.timestamps
    end
  end
end
