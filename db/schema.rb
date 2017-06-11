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

ActiveRecord::Schema.define(version: 20170612213148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "properties", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.integer "beds"
    t.integer "baths"
    t.integer "square_meters"
    t.decimal "price", precision: 14, scale: 2
    t.string "description"
    t.string "title"
    t.index ["x"], name: "index_properties_on_x"
    t.index ["y"], name: "index_properties_on_y"
  end

  create_table "properties_provinces", id: false, force: :cascade do |t|
    t.integer "property_id"
    t.integer "province_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.integer "upper_left_x"
    t.integer "upper_left_y"
    t.integer "bottom_right_x"
    t.integer "bottom_right_y"
    t.index ["upper_left_x", "bottom_right_x"], name: "index_provinces_on_upper_left_x_and_bottom_right_x"
    t.index ["upper_left_y", "bottom_right_y"], name: "index_provinces_on_upper_left_y_and_bottom_right_y"
  end

end
