class ModifyPiecesAddGameId < ActiveRecord::Migration[5.0]
  def change
    remove_index :pieces, name: "index_pieces_on_board_id"
    add_column :pieces, :game_id, :integer
    add_index :pieces, :game_id
    remove_column :pieces, :board_id
  end


end
