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

ActiveRecord::Schema.define(version: 2020_09_13_000218) do

  create_table "books", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.string "author", limit: 100, default: "author", null: false
    t.string "genre", limit: 50, default: "genre", null: false
    t.integer "price", default: -1, null: false
    t.string "published_date", limit: 100, default: "published date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
