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

ActiveRecord::Schema.define(version: 2020_09_25_103632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artista", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "compratores", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "operas", force: :cascade do |t|
    t.string "titolo"
    t.string "tecnica"
    t.decimal "anno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "artista_id"
    t.string "url"
    t.index ["artista_id"], name: "index_operas_on_artista_id"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.decimal "numero"
    t.decimal "mese"
    t.decimal "anno"
    t.decimal "cvv"
    t.string "intestatario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string "titolo", default: "all"
    t.string "tecnica", default: "all"
    t.decimal "anno"
    t.string "artista", default: "all"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "cognome"
    t.date "dob"
    t.string "cellulare"
    t.string "url_foto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "artista_id"
    t.bigint "compratore_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["artista_id"], name: "index_users_on_artista_id"
    t.index ["compratore_id"], name: "index_users_on_compratore_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "operas", "artista", column: "artista_id"
  add_foreign_key "users", "artista", column: "artista_id"
  add_foreign_key "users", "compratores"
end
