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

ActiveRecord::Schema.define(version: 20141003210936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer "player1_id"
    t.integer "player2_id"
    t.string  "move1"
    t.string  "move2"
    t.string  "winner"
    t.integer "tournament_id"
  end

  create_table "players", force: true do |t|
    t.string "name"
    t.string "username"
    t.string "password_hash"
  end

  create_table "tournaments", force: true do |t|
    t.string "name"
  end

end
