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
require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
