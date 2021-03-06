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

ActiveRecord::Schema.define(version: 20160124054125) do

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "job_id",                   limit: 4
    t.integer  "estimated_amount",         limit: 4, default: 0
    t.integer  "company_account_id",       limit: 4,             null: false
    t.integer  "estimated_regular_hours",  limit: 4, default: 0
    t.integer  "estimated_overtime_hours", limit: 4, default: 0
  end

  add_index "budgets", ["company_account_id"], name: "fk_rails_52dd444ed7", using: :btree
  add_index "budgets", ["job_id"], name: "fk_rails_9c80a19020", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255, null: false
    t.string   "state",       limit: 255, null: false
    t.string   "city",        limit: 255, null: false
    t.string   "website",     limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "company_accounts", force: :cascade do |t|
    t.string   "number",       limit: 255, null: false
    t.string   "name",         limit: 255, null: false
    t.string   "account_type", limit: 255
    t.string   "detail_type",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "company_id",   limit: 4
  end

  add_index "company_accounts", ["company_id"], name: "fk_rails_f9fca01a1d", using: :btree
  add_index "company_accounts", ["number"], name: "index_company_accounts_on_number", unique: true, using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "state",      limit: 255, null: false
    t.string   "city",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "company_id", limit: 4
    t.boolean  "awarded"
  end

  add_index "jobs", ["company_id"], name: "fk_rails_b34da78090", using: :btree

  create_table "news_articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "body",       limit: 255, default: ""
    t.boolean  "featured",               default: true
    t.string   "link",       limit: 255
    t.boolean  "deleted",                default: false
    t.integer  "position",   limit: 4,   default: 1
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "role",                   limit: 255, default: "client"
    t.datetime "created_at",                                                                 null: false
    t.datetime "updated_at",                                                                 null: false
    t.integer  "account_id",             limit: 4
    t.string   "email",                  limit: 255, default: "",                            null: false
    t.string   "encrypted_password",     limit: 255, default: "",                            null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,                             null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,                             null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "time_zone",              limit: 255, default: "Mountain Time (US & Canada)"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "budgets", "company_accounts"
  add_foreign_key "budgets", "jobs"
  add_foreign_key "company_accounts", "companies"
  add_foreign_key "jobs", "companies"
end
