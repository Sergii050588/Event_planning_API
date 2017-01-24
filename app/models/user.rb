class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(auth[:provider], auth[:uid])).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth['credentials']["access_token"]
      user.oauth_expires_at = Time.at(auth['credentials']["expires_at"])
      user.save!
    end
  end
end