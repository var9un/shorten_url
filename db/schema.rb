# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_11_053506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analytics_records", force: :cascade do |t|
    t.inet "ip_address"
    t.string "country"
    t.bigint "url_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url_id"], name: "index_analytics_records_on_url_id"
  end

  create_table "urls", force: :cascade do |t|
    t.string "website_url"
    t.string "slug"
    t.integer "no_of_click", default: 0
    t.datetime "expire_url_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
