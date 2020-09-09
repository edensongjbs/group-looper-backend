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

ActiveRecord::Schema.define(version: 2020_09_08_170942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "compositions", force: :cascade do |t|
    t.string "name"
    t.integer "time_sig_num"
    t.integer "time_sig_denom"
    t.float "tempo"
    t.integer "creator_id"
    t.integer "num_bars"
  end

  create_table "layers", force: :cascade do |t|
    t.integer "composition_id"
    t.string "sound_preset_name"
    t.integer "user_id"
    t.string "name"
    t.string "temporary_id"
    t.text "pitch_events"
    t.boolean "read_only"
  end

  create_table "user_compositions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "composition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.string "password_digest"
    t.text "bio"
    t.string "user_name"
    t.string "email"
  end

end
