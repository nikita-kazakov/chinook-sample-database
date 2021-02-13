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

ActiveRecord::Schema.define(version: 2021_02_13_035841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.bigint "support_rep_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["support_rep_id"], name: "index_customers_on_support_rep_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email"
    t.string "title"
    t.integer "reports_to"
    t.date "birth_date"
    t.datetime "hire_date"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.string "phone"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_lines", force: :cascade do |t|
    t.bigint "invoice_id"
    t.bigint "track_id"
    t.integer "unit_price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_lines_on_invoice_id"
    t.index ["track_id"], name: "index_invoice_lines_on_track_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "customer_id"
    t.datetime "invoice_date"
    t.string "billing_address"
    t.string "billing_city"
    t.string "billing_state"
    t.string "billing_country"
    t.string "billing_postal_code"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "media_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlist_tracks", force: :cascade do |t|
    t.bigint "playlist_id"
    t.bigint "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_playlist_tracks_on_playlist_id"
    t.index ["track_id"], name: "index_playlist_tracks_on_track_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.bigint "album_id"
    t.bigint "media_type_id"
    t.bigint "genre_id"
    t.string "composer"
    t.integer "milliseconds"
    t.integer "bytes"
    t.integer "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_tracks_on_album_id"
    t.index ["genre_id"], name: "index_tracks_on_genre_id"
    t.index ["media_type_id"], name: "index_tracks_on_media_type_id"
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "customers", "employees", column: "support_rep_id"
  add_foreign_key "invoice_lines", "invoices"
  add_foreign_key "invoice_lines", "tracks"
  add_foreign_key "invoices", "customers"
  add_foreign_key "playlist_tracks", "playlists"
  add_foreign_key "playlist_tracks", "tracks"
  add_foreign_key "tracks", "albums"
  add_foreign_key "tracks", "genres"
  add_foreign_key "tracks", "media_types"
end
