class AddWhiteidBlackidWinneridToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :white_id, :integer
    add_column :games, :black_id, :integer
    add_column :games, :winner_id, :integer
  end
end
