class AddEmailToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :email, :string
  end
end
