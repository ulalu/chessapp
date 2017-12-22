class ChangeNullableAndDefaultEmailValueUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :email, :string, null: false, default: ""
  end
end
