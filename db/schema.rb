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

ActiveRecord::Schema.define(version: 20181108224349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_colleges_on_user_id"
  end

  create_table "computers", force: :cascade do |t|
    t.string "name"
    t.integer "asset_id"
    t.boolean "archive", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_asset_id"
  end

  create_table "flex_hours", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "week_id"
    t.text "reason"
    t.integer "num_minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flex_hours_on_user_id"
    t.index ["week_id"], name: "index_flex_hours_on_week_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.boolean "archive", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "required", default: false, null: false
  end

  create_table "forms_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "form_id"
    t.index ["form_id"], name: "index_forms_users_on_form_id"
    t.index ["user_id"], name: "index_forms_users_on_user_id"
  end

  create_table "hour_exceptions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "submitter"
    t.date "date_applicable"
    t.date "date_sent"
    t.text "reason"
    t.bigint "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week_id"
    t.boolean "made_up_hours", default: false, null: false
    t.index ["user_id"], name: "index_hour_exceptions_on_user_id"
    t.index ["year_id"], name: "index_hour_exceptions_on_year_id"
  end

  create_table "hour_overrides", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "year_id"
    t.integer "hours_required"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hour_overrides_on_user_id"
    t.index ["year_id"], name: "index_hour_overrides_on_year_id"
  end

  create_table "laptimelogs", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.datetime "timein"
    t.datetime "timeout"
    t.integer "time_logged"
    t.datetime "updated_at"
    t.integer "year_id"
    t.integer "week_id"
    t.integer "asset_id"
    t.index ["asset_id"], name: "index_laptop_timelogs_on_asset_id"
    t.index ["user_id"], name: "index_laptop_timelogs_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.text "message"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.integer "pre_meetings"
    t.integer "pre_hours"
    t.integer "build_meetings"
    t.integer "freshman_hours"
    t.integer "sophomore_hours"
    t.integer "junior_hours"
    t.integer "senior_hours"
    t.integer "leadership_hours"
    t.bigint "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_flex_hours"
    t.index ["year_id"], name: "index_requirements_on_year_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timelogs", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "timein"
    t.datetime "timeout"
    t.integer "time_logged"
    t.datetime "updated_at"
    t.integer "year_id"
    t.integer "week_id"
    t.index ["user_id"], name: "index_timelogs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "phone"
    t.string "name_first"
    t.string "name_last"
    t.string "userid"
    t.integer "school_id"
    t.boolean "basicSafety"
    t.string "password_salt"
    t.string "password_hash"
    t.boolean "archive", default: false, null: false
    t.string "location"
    t.string "gender"
    t.string "graduation_year"
    t.boolean "student_leader"
    t.boolean "read_only", default: false, null: false
    t.boolean "member"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "week_exceptions", force: :cascade do |t|
    t.date "date"
    t.decimal "weight"
    t.text "reason"
    t.bigint "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week_id"
    t.index ["year_id"], name: "index_week_exceptions_on_year_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.date "week_start"
    t.date "week_end"
    t.string "season"
    t.bigint "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_id"], name: "index_weeks_on_year_id"
  end

  create_table "years", force: :cascade do |t|
    t.date "year_start"
    t.date "year_end"
    t.date "build_season_start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "preseason_start"
  end

  add_foreign_key "colleges", "users"
  add_foreign_key "flex_hours", "users"
  add_foreign_key "flex_hours", "weeks"
  add_foreign_key "messages", "users"
  add_foreign_key "requirements", "years"
  add_foreign_key "weeks", "years"
end
