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


ActiveRecord::Schema.define(version: 20141212214959) do

  create_table "case_logs", force: true do |t|
    t.string   "patient_name"
    t.date     "patient_date_of_birth"
    t.integer  "patient_gender",        default: 0
    t.string   "description"
    t.string   "diagnosis"
    t.string   "treatment"
    t.string   "title"
    t.string   "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", force: true do |t|
    t.string   "license"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "state"
    t.boolean  "admin",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "description"
    t.string   "case_log_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shares", force: true do |t|
    t.string   "case_log_id"
    t.string   "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
