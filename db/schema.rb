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

ActiveRecord::Schema.define(version: 2019_10_29_012326) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.integer "phone_number"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "uid"
    t.string "worker_number"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "job_title"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "worker_number"
  end

  create_table "jobs", force: :cascade do |t|
    t.text "concern"
    t.boolean "completed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "repair_order_id"
  end

  create_table "repair_orders", force: :cascade do |t|
    t.integer "vehicle_id"
    t.boolean "finished", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id"
    t.integer "employee_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "miles"
    t.string "vin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id"
  end

end
