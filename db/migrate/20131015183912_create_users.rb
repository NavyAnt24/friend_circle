class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :session_token

      t.timestamps
    end
    add_index :users, :session_token
    add_index :users, :email
  end
end
