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

ActiveRecord::Schema.define(version: 2018_05_29_181039) do

  create_table "book_lists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["term_id"], name: "index_book_lists_on_term_id"
  end

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "author"
    t.string "title"
    t.string "sku"
    t.decimal "price", precision: 10
    t.integer "stock"
    t.boolean "reqopt"
    t.string "term"
    t.bigint "courses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courses_id"], name: "index_books_on_courses_id"
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "instructors"
    t.string "sections"
    t.string "department"
    t.integer "number"
    t.string "term"
    t.bigint "book_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_list_id"], name: "index_courses_on_book_list_id"
  end

  create_table "terms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "term_code"
    t.string "term_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_lists", "terms"
  add_foreign_key "books", "courses", column: "courses_id"
  add_foreign_key "courses", "book_lists"
end
