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

ActiveRecord::Schema.define(version: 20180320190745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audit_messages", force: :cascade do |t|
    t.string "channel"
    t.string "message"
    t.bigint "org_id"
    t.index ["org_id"], name: "index_audit_messages_on_org_id"
  end

  create_table "contributors", force: :cascade do |t|
    t.string "github_name"
    t.string "slack_name"
    t.bigint "org_id"
    t.index ["org_id"], name: "index_contributors_on_org_id"
  end

  create_table "orgs", force: :cascade do |t|
    t.string "login"
    t.string "description"
    t.integer "github_id"
    t.string "url"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orgs_on_user_id"
  end

  create_table "stats", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created"
    t.datetime "closed"
    t.integer "hours"
    t.integer "change_count"
    t.integer "comments"
    t.bigint "org_id"
    t.index ["org_id"], name: "index_stats_on_org_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "github_token"
    t.string "slack_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "github_id"
    t.boolean "simulation_mode"
  end

  add_foreign_key "audit_messages", "orgs"
  add_foreign_key "contributors", "orgs"
  add_foreign_key "orgs", "users"
  add_foreign_key "stats", "orgs"
end
