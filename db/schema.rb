# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160217231126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.text     "description"
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
    t.string   "slug"
    t.string   "label",       default: "hamburg"
    t.integer  "limit"
  end

  add_index "events", ["location_id"], name: "index_events_on_location_id", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "highlights", force: :cascade do |t|
    t.string   "description"
    t.string   "url"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "label",       default: "hamburg"
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "location_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "label",       default: "hamburg"
  end

  add_index "jobs", ["location_id"], name: "index_jobs_on_location_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "street"
    t.string   "house_number"
    t.string   "city"
    t.string   "zip"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "company"
    t.string   "label",        default: "hamburg"
    t.string   "slug"
    t.string   "wheelmap_id"
  end

  add_index "locations", ["id"], name: "index_locations_on_id", using: :btree
  add_index "locations", ["slug"], name: "index_locations_on_slug", unique: true, using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "preview_type"
    t.string   "preview_code"
    t.integer  "topic_id"
  end

  add_index "materials", ["event_id"], name: "index_materials_on_event_id", using: :btree
  add_index "materials", ["user_id"], name: "index_materials_on_user_id", using: :btree

  create_table "participants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "maybe"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id", using: :btree
  add_index "participants", ["user_id"], name: "index_participants_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label",         default: "hamburg"
    t.string   "slug"
    t.string   "proposal_type", default: "proposal"
  end

  add_index "topics", ["event_id"], name: "index_topics_on_event_id", using: :btree
  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "name"
    t.string   "image"
    t.string   "url"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "github"
    t.boolean  "admin"
    t.boolean  "freelancer"
    t.boolean  "available"
    t.string   "slug"
    t.boolean  "hide_jobs",   default: false
    t.string   "twitter"
    t.string   "email"
    t.boolean  "super_admin", default: false
  end

  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

end
