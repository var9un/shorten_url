# == Schema Information
#
# Table name: analytics_records
#
#  id         :bigint           not null, primary key
#  ip_address :inet
#  country    :string
#  url_id     :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AnalyticsRecord < ApplicationRecord
  belongs_to :url , counter_cache: :no_of_click

  def set_analytics_record(request)
    self.ip_address = request.ip
    self.country    = request.location.country
  end
end
