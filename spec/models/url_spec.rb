require 'rails_helper'

RSpec.describe Url, type: :model do
  describe 'save fileds in a model' do
    url = Url.create(website_url: 'https://google.com')

    it "create slug" do
      expect(url.slug).to_not eq nil
    end

    it "created slug size should be 5" do
      expect(url.slug.length).to eq 5
    end

    it "saves expire_url_time" do
      expect(url.expire_url_time).to_not eq nil
    end

    it "expire_url_time is greater then today" do
      expect(url.expire_url_time).to be > Time.now
    end

    context 'Analytical data: top_countries' do
      url = Url.create(website_url: 'https://yahoo.com')

      url.analytics_records.create(country: 'India')
      url.analytics_records.create(country: 'India')
      url.analytics_records.create(country: 'Canada')
      url.analytics_records.create(country: 'Canada')
      url.analytics_records.create(country: 'England')

      it{expect(url.top_countries).to eq(['India', 'Canada', 'England'])}
    end
  end

  describe 'check constants' do
    it 'check SLUG_LENGTH constant size should be 5' do
      expect(SLUG_LENGTH).to eq(5)
    end
    it 'check EXPIRATION_TIME constant size should be 30' do
      expect(EXPIRATION_TIME).to eq(30)
    end
  end

  describe 'check validation' do
    it 'Should be invalid without any attribute' do
      url = Url.new()
      expect(url).not_to be_valid
    end

    it 'Should be valid with valid attribute' do
      url = Url.new(website_url: 'https://google.com')
      expect(url).to be_valid
    end

    it 'Should be invalid with invalid attribute' do
      url = Url.new(website_url: 'google')
      expect(url).not_to be_valid
    end
  end
end
