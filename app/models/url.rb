# == Schema Information
#
# Table name: urls
#
#  id              :bigint           not null, primary key
#  website_url     :string
#  slug            :string
#  no_of_click     :integer          default(0)
#  expire_url_time :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Url < ApplicationRecord
  #Validation
  validates :website_url, url: true

  #Callback
  before_create :create_slug
  before_create :set_expiration_time

  #Associations
  has_many :analytics_records, dependent: :destroy

  def save_analytics_record(request)
    analytics = self.analytics_records.new
    analytics.set_analytics_record(request)
    analytics.save
  end

  def top_countries
    url_countries = AnalyticsRecord.pluck(:country)
    return [] unless url_countries.any?
    url_countries.group_by {|country| country}.sort_by {|key, country_arr| -country_arr.count}.map(&:first)
  end

private
  def create_slug
    new_slug = SecureRandom.base64[0...SLUG_LENGTH]
    create_slug if Url.exists?(website_url: new_slug)
    self.slug = new_slug
  end

  def set_expiration_time
    self.expire_url_time = (Time.now + EXPIRATION_TIME.days)
  end

end
