class FavoriteContact < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  validates :contact_id, uniqueness: { scope: :user_id }
  validate :contact_is_in_users_extended_contacts

  belongs_to :user
  belongs_to :contact

  private

  def contact_is_in_users_extended_contacts
    unless User.find(user_id).contacts.pluck(:id).include?(contact_id) || User.find(user_id).shared_contacts.pluck(:id).include?(contact_id)
      raise[:base] << "must be in user's contact list"
    end
  end
end
