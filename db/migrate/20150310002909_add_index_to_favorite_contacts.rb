class AddIndexToFavoriteContacts < ActiveRecord::Migration
  def change
    add_index :favorite_contacts, [:user_id, :contact_id], unique: true
  end
end
