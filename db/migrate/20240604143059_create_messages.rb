class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :private_chat, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key "messages", "private_chats"
    add_foreign_key "messages", "profiles"
  end
end
