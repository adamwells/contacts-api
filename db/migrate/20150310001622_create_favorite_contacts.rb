class CreateFavoriteContacts < ActiveRecord::Migration
  def change
    create_table :favorite_contacts do |t|
      t.integer :user_id, null: false, index: true
      t.integer :contact_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
