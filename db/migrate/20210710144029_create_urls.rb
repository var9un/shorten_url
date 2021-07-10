class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :slug
      t.integer :no_of_click
      t.datetime :expire_url_time
      t.timestamps
    end
  end
end
