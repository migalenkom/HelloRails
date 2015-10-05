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

ActiveRecord::Schema.define(version: 20151005075528) do

  create_table "api_configs", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "key",          limit: 255
    t.string   "secret",       limit: 255
    t.string   "token",        limit: 255
    t.string   "token_secret", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "columns", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "position",   limit: 4
    t.integer  "project_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "creator_id",  limit: 4
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "organization_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "projects", ["organization_id"], name: "index_projects_on_organization_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "position",   limit: 4
    t.integer  "column_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
  end

  create_table "user_organizations", force: :cascade do |t|
    t.integer "user_id",         limit: 4
    t.integer "organization_id", limit: 4
  end

  add_index "user_organizations", ["organization_id"], name: "index_user_organizations_on_organization_id", using: :btree
  add_index "user_organizations", ["user_id"], name: "index_user_organizations_on_user_id", using: :btree

  create_table "user_uploads", force: :cascade do |t|
    t.integer "user_id",   limit: 4
    t.integer "upload_id", limit: 4
  end

  add_index "user_uploads", ["upload_id"], name: "index_user_uploads_on_upload_id", using: :btree
  add_index "user_uploads", ["user_id"], name: "index_user_uploads_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",               limit: 255
    t.string   "password_hash",       limit: 255
    t.string   "password_salt",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isAdmin",             limit: 1,   default: false, null: false
    t.string   "name",                limit: 255
    t.boolean  "superAdmin",          limit: 1,   default: false, null: false
    t.integer  "row_order",           limit: 4
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
    t.string   "api_key",             limit: 255
  end

end
