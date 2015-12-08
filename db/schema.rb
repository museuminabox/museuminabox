# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151208032451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boops", force: :cascade do |t|
    t.integer  "box_id"
    t.integer  "print_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "boops", ["box_id"], name: "index_boops_on_box_id", using: :btree
  add_index "boops", ["print_id"], name: "index_boops_on_print_id", using: :btree

  create_table "boxes", force: :cascade do |t|
    t.integer  "collection_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "collections", force: :cascade do |t|
    t.text     "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.text     "name",       null: false
    t.text     "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.integer  "thing_id",    null: false
    t.text     "url",         null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "media", force: :cascade do |t|
    t.integer  "thing_id",      null: false
    t.integer  "media_type",    null: false
    t.text     "link_or_embed", null: false
    t.text     "attribution"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "prints", force: :cascade do |t|
    t.integer  "thing_id",             null: false
    t.integer  "box_id",               null: false
    t.float    "width_in_m",           null: false
    t.float    "height_in_m",          null: false
    t.float    "depth_in_m",           null: false
    t.float    "print_scale",          null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.text     "image"
    t.text     "image_alt_text"
    t.text     "brain_filename_video"
    t.text     "brain_filename_audio"
  end

  create_table "things", force: :cascade do |t|
    t.integer  "institution_id"
    t.text     "name",                                       null: false
    t.text     "creators",                    default: [],   null: false, array: true
    t.text     "description",                                null: false
    t.text     "description_attribution_url",                null: false
    t.text     "wikipedia_url"
    t.text     "tags",                        default: [],   null: false, array: true
    t.boolean  "three_dimensions",            default: true, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.float    "lat"
    t.float    "long"
    t.text     "image"
    t.text     "image_alt_text"
    t.integer  "collection_id"
  end

  add_foreign_key "prints", "things", name: "thing_id"
end
