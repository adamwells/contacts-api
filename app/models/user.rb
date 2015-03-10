# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           default("default"), not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_many :contacts, dependent: :destroy
  has_many :contact_shares, dependent: :destroy

  has_many :comments, as: :commentable, dependent: :destroy

  has_many :shared_contacts, through: :contact_shares, source: :contact
  has_many :favorite_connections, class_name: 'FavoriteContact'
  has_many :favorite_contacts, through: :favorite_connections, source: :contact

  def all_contacts
    contacts + shared_contacts
  end
end
