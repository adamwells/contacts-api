class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.integer :user_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :contacts, :user_ids
    add_index :contacts, [:user_id, :email], unique: true
  end
end
