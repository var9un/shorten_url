class Url < ApplicationRecord
  validates :website_url, url: true
  before_create :create_slug
  before_create :set_expiration_time




private
  def create_slug
    new_slug = Base64.encode64(self.website_url)[0..5]
    create_slug if Url.exists?(website_url: new_slug)
    self.slug = new_slug
  end

  def set_expiration_time
    self.expire_url_time = (Time.now + 30.days)
  end
end
