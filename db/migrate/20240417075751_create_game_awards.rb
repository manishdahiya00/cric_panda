class CreateGameAwards < ActiveRecord::Migration[7.1]
  def change
    create_table :game_awards do |t|
      t.string :title
      t.string :image_url
      t.text :rules
      t.boolean :status,default:false
      t.string :identifier
      t.string :redirect_url
      t.string :input_name
      t.string :publisher

      t.timestamps
    end
  end
end
