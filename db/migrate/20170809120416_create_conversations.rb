class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
    add_index :conversations, [:sender_id, :receiver_id], unique: true
  end
end
