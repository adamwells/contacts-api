# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean          default("f"), not null
#

class ContactShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
end
