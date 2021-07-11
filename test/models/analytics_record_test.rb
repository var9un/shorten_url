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
require 'test_helper'

class AnalyticsRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
