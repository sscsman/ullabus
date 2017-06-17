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

ActiveRecord::Schema.define(version: 20170617065617) do

  create_table "comments", force: :cascade do |t|
    t.integer  "courseid",    limit: 4
    t.text     "message",     limit: 65535
    t.integer  "year",        limit: 4
    t.integer  "typos",       limit: 4,     default: 0
    t.integer  "goods",       limit: 4,     default: 0
    t.integer  "bads",        limit: 4,     default: 0
    t.integer  "usersid",     limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "bycommented", limit: 4,     default: 0
  end

  create_table "courses", force: :cascade do |t|
    t.string   "coursename", limit: 255
    t.string   "teacher",    limit: 255
    t.integer  "credits",    limit: 4
    t.string   "duration",   limit: 255
    t.string   "weekday",    limit: 255
    t.string   "code",       limit: 255
    t.string   "univ",       limit: 255
    t.string   "dept",       limit: 255
    t.integer  "creator",    limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "pv",         limit: 4,     default: 0
    t.text     "likedby",    limit: 65535
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "courseid",   limit: 4, default: 0
    t.integer  "vote",       limit: 4, default: 0
    t.integer  "teacher",    limit: 4, default: 0
    t.integer  "courserate", limit: 4, default: 0
    t.integer  "easy",       limit: 4, default: 0
    t.integer  "attendance", limit: 4, default: 0
    t.integer  "homework",   limit: 4, default: 0
    t.integer  "credit",     limit: 4, default: 0
    t.integer  "taker",      limit: 4, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",    null: false
    t.string   "encrypted_password",     limit: 255,   default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "univ",                   limit: 255
    t.string   "dept",                   limit: 255
    t.string   "majorin",                limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.text     "createdclass",           limit: 65535
    t.text     "ratedclass",             limit: 65535
    t.text     "votedclass",             limit: 65535
    t.text     "commentedclass",         limit: 65535
    t.text     "commentedid",            limit: 65535
    t.text     "votedcomid",             limit: 65535
    t.text     "likedclass",             limit: 65535
    t.text     "bycommented",            limit: 65535
    t.boolean  "admin",                                default: false
    t.boolean  "comnotfy",                             default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
