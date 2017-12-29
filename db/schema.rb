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

ActiveRecord::Schema.define(version: 20171227231727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "synopsis"
    t.text     "content"
    t.integer  "location_id"
    t.string   "location_building"
    t.string   "location_address"
    t.string   "location_address2"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zip"
    t.string   "location_googlemapsid"
    t.datetime "start"
    t.datetime "end"
    t.integer  "videos_id"
    t.integer  "images_id"
    t.integer  "links_id"
    t.float    "price"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["images_id"], name: "index_events_on_images_id", using: :btree
    t.index ["links_id"], name: "index_events_on_links_id", using: :btree
    t.index ["location_id"], name: "index_events_on_location_id", using: :btree
    t.index ["videos_id"], name: "index_events_on_videos_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.string   "building"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "leader"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "googlemapsid"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
    t.integer  "weekday"
    t.time     "time"
    t.integer  "service_id"
    t.index ["location_id"], name: "index_meetings_on_location_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.string   "keywords"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "title"
    t.integer  "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "meetings", "locations"
end
