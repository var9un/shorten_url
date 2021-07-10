class CreateAnalyticsRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :analytics_records do |t|
      t.inet :ip_address
      t.string :country
      t.belongs_to :url
      t.timestamps
    end
  end
end
