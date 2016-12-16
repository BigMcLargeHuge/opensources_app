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

ActiveRecord::Schema.define(version: 20161216005614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.text     "issue_text"
    t.string   "domain"
    t.integer  "user_id"
    t.integer  "website_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree
  add_index "issues", ["website_id"], name: "index_issues_on_website_id", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.string   "domain"
    t.string   "website_type"
    t.text     "notes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag_text"
    t.text     "notes"
    t.integer  "website_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tags", ["submission_id"], name: "index_tags_on_submission_id", using: :btree
  add_index "tags", ["website_id"], name: "index_tags_on_website_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "websites", force: :cascade do |t|
    t.string   "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "issues", "users"
  add_foreign_key "issues", "websites"
  add_foreign_key "tags", "submissions"
  add_foreign_key "tags", "websites"
end
