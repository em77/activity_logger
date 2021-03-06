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

ActiveRecord::Schema.define(version: 20190207040909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logs", force: :cascade do |t|
    t.string   "staff_last_name"
    t.string   "member_first_name"
    t.string   "member_last_name"
    t.integer  "duration"
    t.string   "start_time"
    t.integer  "education_support"
    t.integer  "pre_vocational"
    t.integer  "transitional_employment"
    t.integer  "intensive_supported_employment"
    t.integer  "ongoing_supported_employment"
    t.integer  "psychosocial_rehabilitation"
    t.integer  "habilitation"
    t.integer  "family_support"
    t.integer  "face_to_face"
    t.text     "activity_log"
    t.text     "follow_up"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "status",                         default: 0
    t.integer  "nbs",                            default: 0
    t.date     "date"
    t.string   "staff_first_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "role"
    t.string   "last_name"
    t.string   "first_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree

end
