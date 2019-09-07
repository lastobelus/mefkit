# == Schema Information
#
# Table name: identities
#
#  access_token      :string
#  email             :string
#  image             :string
#  name              :string
#  nickname          :string
#  phone             :string
#  provider          :string           indexed => [uid]
#  refresh_token     :string
#  uid               :string           indexed => [provider]
#  urls              :text
#
# Indexes
#
#  index_identities_on_identifiable_type_and_identifiable_id  (identifiable_type,identifiable_id)
#  index_identities_on_provider_and_uid                       (provider,uid) UNIQUE
#

class Identity < ApplicationRecord
  belongs_to :identifiable, polymorphic: true

  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.find_with_omniauth(auth)
    find_by(uid: auth["uid"], provider: auth["provider"])
  end

  def self.create_with_omniauth(auth)
    create(uid: auth["uid"], provider: auth["provider"])
  end

  def self.find_for_oauth(auth)
    identity = begin
                 Identity.find_or_create_by(provider: auth.provider, uid: auth.uid)
               rescue ActiveRecord::RecordNotUnique
                 retry
               end

    identity.access_token = auth.credentials.token
    identity.refresh_token = auth.credentials.refresh_token
    identity.name = auth.info.name
    identity.email = auth.info.email
    identity.nickname = auth.info.nickname
    identity.image = auth.info.image
    identity.phone = auth.info.phone
    identity.urls = (auth.info.urls || "").to_json
    identity.save
    identity
  end
end
