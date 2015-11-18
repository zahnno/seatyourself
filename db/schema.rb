
ActiveRecord::Schema.define(version: 20151118153010) do

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "capacity"
    t.integer  "time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "price"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
