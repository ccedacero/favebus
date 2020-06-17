# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_17_000318) do

  create_table "bus_routes", force: :cascade do |t|
    t.string "route"
    t.string "arrival_time"
    t.string "bus_distance"
    t.string "destination_name"
    t.string "dispace_by_stops"
    t.string "last_update"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rider_route_data", force: :cascade do |t|
    t.integer "stop_id"
    t.string "stop_name"
  end

  create_table "rider_routes", force: :cascade do |t|
    t.integer "stop_id"
    t.string "stop_name"
    t.integer "rider_id", null: false
    t.integer "bus_route_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bus_route_id"], name: "index_rider_routes_on_bus_route_id"
    t.index ["rider_id"], name: "index_rider_routes_on_rider_id"
  end

  create_table "riders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "route_data", force: :cascade do |t|
    t.integer "stop_id"
    t.string "stop_name"
    t.string "route"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "rider_routes", "bus_routes"
  add_foreign_key "rider_routes", "riders"
end
