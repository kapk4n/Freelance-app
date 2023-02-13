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

ActiveRecord::Schema[7.0].define(version: 2023_02_11_174341) do
  create_table "clients", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "freelancers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "info"
    t.string "stack"
    t.string "languag"
    t.integer "experienc"
    t.string "education"
    t.index ["user_id"], name: "index_freelancers_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "freelanc_id"
    t.string "title"
    t.integer "cost"
    t.string "message"
    t.date "deadline"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "pre_orders", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "freelancer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelancer_id"], name: "index_pre_orders_on_freelancer_id"
    t.index ["order_id"], name: "index_pre_orders_on_order_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "freelancer_id", null: false
    t.integer "order_id", null: false
    t.string "message"
    t.integer "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelancer_id"], name: "index_reviews_on_freelancer_id"
    t.index ["order_id"], name: "index_reviews_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "f_name"
    t.string "l_name"
    t.integer "sex"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clients", "users"
  add_foreign_key "freelancers", "users"
  add_foreign_key "orders", "clients"
  add_foreign_key "pre_orders", "freelancers"
  add_foreign_key "pre_orders", "orders"
  add_foreign_key "reviews", "freelancers"
  add_foreign_key "reviews", "orders"
end
