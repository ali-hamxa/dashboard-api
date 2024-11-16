# frozen_string_literal: true

ActiveRecord::Schema[7.1].define(version: 2024_11_16_031024) do
  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "continent", null: false
    t.string "country", null: false
    t.string "state", null: false
    t.string "city", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end
end
