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

ActiveRecord::Schema.define(version: 20170227200130) do

  create_table "acquaintanceships", force: :cascade do |t|
    t.integer "spider_id"
    t.integer "acquaintance_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "spider_interests", force: :cascade do |t|
    t.integer "spider_id"
    t.integer "interest_id"
  end

  create_table "spiders", force: :cascade do |t|
    t.string  "name"
    t.string  "password_digest"
    t.string  "spider_type"
    t.string  "mood"
    t.integer "level"
    t.boolean "alive"
    t.boolean "status"
  end

end
