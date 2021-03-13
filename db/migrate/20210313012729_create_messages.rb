class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.text :name, null: false
      t.timestamps
    end
    create_table :messages do |t|
      t.references :user, foreign_key: true, null: false
      t.references :room, foreign_key: true, null: false
      t.text :content, null: false
      t.timestamps
    end

    create_table :room_users do |t|
      t.references :user, foreign_key: true, null: false
      t.references :room, foreign_key: true, null: false
      t.timestamps
    end
    add_index :room_users, [:room_id, :user_id], unique: true
  end
end
