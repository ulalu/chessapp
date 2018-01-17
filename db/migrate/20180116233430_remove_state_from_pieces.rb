class RemoveStateFromPieces < ActiveRecord::Migration[5.0]
  def change
    remove_column :pieces, :state, :string
  end
end
