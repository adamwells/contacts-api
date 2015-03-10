# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean          default("f"), not null
#

class Contact < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :user_id, uniqueness: { scope: :email }

  belongs_to(
    :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
  )

  has_many :contact_shares, dependent: :destroy
  has_many :comments, :as => :commentable, dependent: :destroy

  has_many(
    :shared_users,
    through: :contact_shares,
    source: :user
  )
end
