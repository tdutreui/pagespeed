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

ActiveRecord::Schema.define(version: 2021_01_30_111718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lighthouse_reports", force: :cascade do |t|
    t.text "json_report_desktop"
    t.integer "score_desktop"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "json_report_mobile"
    t.integer "score_mobile"
    t.bigint "page_id"
    t.index ["page_id"], name: "index_lighthouse_reports_on_page_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "url"
    t.string "valid_url"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "daily_run"
    t.boolean "weekly_run"
    t.boolean "send_drop_alert_email"
    t.index ["project_id"], name: "index_pages_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lighthouse_reports", "pages"
  add_foreign_key "pages", "projects"
  add_foreign_key "projects", "users"
end
