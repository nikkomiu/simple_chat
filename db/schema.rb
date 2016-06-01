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

ActiveRecord::Schema.define(version: 20160601164804) do

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "team_id"
    t.integer  "team_folder_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["team_folder_id"], name: "index_rooms_on_team_folder_id"
    t.index ["team_id"], name: "index_rooms_on_team_id"
  end

  create_table "team_folders", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_team_folders_on_parent_id"
    t.index ["team_id"], name: "index_team_folders_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
