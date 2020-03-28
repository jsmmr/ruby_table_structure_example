class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :user, index: false, null: false, foreign_key: true
      t.references :friend_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :friends, [:user_id, :friend_user_id], unique: true
  end
end
