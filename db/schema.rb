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

ActiveRecord::Schema.define(version: 2021_04_21_001639) do

  create_table "buzzs", force: :cascade do |t|
    t.integer "contestant_id", null: false
    t.integer "game_id", null: false
    t.boolean "buzzed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sender"
    t.index ["contestant_id"], name: "index_buzzs_on_contestant_id"
    t.index ["game_id"], name: "index_buzzs_on_game_id"
  end

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.integer "score"
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_contestants_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "round"
    t.text "prompt"
    t.text "answer"
    t.integer "value"
    t.boolean "seen"
    t.integer "game_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.index ["game_id"], name: "index_questions_on_game_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buzzs", "contestants"
  add_foreign_key "buzzs", "games"
  add_foreign_key "contestants", "games"
  add_foreign_key "games", "users"
  add_foreign_key "questions", "games"
  add_foreign_key "questions", "users"
end
