class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.string :type
      t.integer :board_id
      t.string :special
      t.string :color
      t.integer :position_x
      t.integer :position_y
      t.boolean :dead
      t.timestamps
    end
    change_column :pieces, :id, :bigint
    add_index :pieces, :board_id
  end
end
