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

ActiveRecord::Schema.define(version: 20150808213356) do

  create_table "course_holes", force: :cascade do |t|
    t.integer  "hole_number",   limit: 4
    t.integer  "black_length",  limit: 4
    t.integer  "blue_length",   limit: 4
    t.integer  "white_length",  limit: 4
    t.integer  "red_length",    limit: 4
    t.integer  "green_length",  limit: 4
    t.integer  "senior_length", limit: 4
    t.integer  "par",           limit: 4
    t.integer  "course_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "address1",       limit: 255
    t.string   "address2",       limit: 255
    t.string   "address3",       limit: 255
    t.string   "city",           limit: 255
    t.string   "state",          limit: 255
    t.integer  "zip",            limit: 4
    t.integer  "course_type_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "round_holes", force: :cascade do |t|
    t.integer  "round_id",       limit: 4
    t.integer  "course_hole_id", limit: 4
    t.integer  "score",          limit: 4
    t.integer  "putts",          limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "course_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "round_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
