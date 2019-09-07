# == Schema Information
#
# Table name: identities
#
#  provider          :string
#  uid               :string
#
# Indexes
#
#  index_identities_on_identifiable_type_and_identifiable_id  (identifiable_type,identifiable_id)
#

class Identity < ApplicationRecord
  belongs_to :identifiable, polymorphic: true

  def self.find_with_omniauth(auth)
    find_by(uid: auth["uid"], provider: auth["provider"])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth["uid"], provider: auth["provider"])
  end
end
