class AddColumnToUsers2 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string, null:false
    add_column :users, :session_token, :string, null:false
    add_index :users, :user_name, unique: true
    add_index :users, :session_token, unique: true
  end
end