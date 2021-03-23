# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_23_012742) do

  create_table "income", force: :cascade do |t|
    t.integer "yearly_income"
  end

  create_table "investors", force: :cascade do |t|
    t.string "name"
    t.integer "buildings_owned"
  end

  create_table "rentals", force: :cascade do |t|
    t.string "property_type"
    t.string "address"
    t.string "bedrooms"
    t.string "bathrooms"
    t.string "lease_length"
    t.integer "monthly_rent"
    t.boolean "second_floor"
    t.boolean "pets_allowed"
    t.string "availability"
    t.integer "investor_id"
    t.index ["investor_id"], name: "index_rentals_on_investor_id"
  end

  create_table "yearlyincome", force: :cascade do |t|
    t.integer "yearly_income"
  end

  add_foreign_key "rentals", "investors"
end
