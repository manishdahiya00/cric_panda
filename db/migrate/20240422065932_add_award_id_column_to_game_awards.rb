class AddAwardIdColumnToGameAwards < ActiveRecord::Migration[7.1]
  def change
    add_column :game_awards,:award_id,:string
  end
end
