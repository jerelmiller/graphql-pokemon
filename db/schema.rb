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

ActiveRecord::Schema.define(version: 20170403035236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "effects", force: :cascade do |t|
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "move_methods", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_move_methods_on_name", unique: true, using: :btree
  end

  create_table "moves", force: :cascade do |t|
    t.integer  "type_id",       null: false
    t.integer  "effect_id",     null: false
    t.string   "name",          null: false
    t.integer  "power"
    t.integer  "pp",            null: false
    t.integer  "accuracy"
    t.integer  "effect_chance"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["effect_id"], name: "index_moves_on_effect_id", using: :btree
    t.index ["name"], name: "index_moves_on_name", unique: true, using: :btree
    t.index ["type_id"], name: "index_moves_on_type_id", using: :btree
  end

  create_table "pokemon_moves", force: :cascade do |t|
    t.integer  "pokemon_id",     null: false
    t.integer  "move_id",        null: false
    t.integer  "level",          null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "move_method_id", null: false
    t.index ["move_id"], name: "index_pokemon_moves_on_move_id", using: :btree
    t.index ["move_method_id"], name: "index_pokemon_moves_on_move_method_id", using: :btree
    t.index ["pokemon_id"], name: "index_pokemon_moves_on_pokemon_id", using: :btree
  end

  create_table "pokemon_strengths", force: :cascade do |t|
    t.integer  "pokemon_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemon_strengths_on_pokemon_id_and_type_id", unique: true, using: :btree
    t.index ["pokemon_id"], name: "index_pokemon_strengths_on_pokemon_id", using: :btree
    t.index ["type_id"], name: "index_pokemon_strengths_on_type_id", using: :btree
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.integer  "pokemon_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemon_types_on_pokemon_id_and_type_id", unique: true, using: :btree
    t.index ["pokemon_id"], name: "index_pokemon_types_on_pokemon_id", using: :btree
    t.index ["type_id"], name: "index_pokemon_types_on_type_id", using: :btree
  end

  create_table "pokemon_weaknesses", force: :cascade do |t|
    t.integer  "pokemon_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemon_weaknesses_on_pokemon_id_and_type_id", unique: true, using: :btree
    t.index ["pokemon_id"], name: "index_pokemon_weaknesses_on_pokemon_id", using: :btree
    t.index ["type_id"], name: "index_pokemon_weaknesses_on_type_id", using: :btree
  end

  create_table "pokemons", force: :cascade do |t|
    t.string  "number",          null: false
    t.string  "name",            null: false
    t.text    "description"
    t.integer "attack",          null: false
    t.integer "defense",         null: false
    t.integer "hp",              null: false
    t.integer "special_attack",  null: false
    t.integer "special_defense", null: false
    t.integer "speed",           null: false
    t.index ["name"], name: "index_pokemons_on_name", unique: true, using: :btree
    t.index ["number"], name: "index_pokemons_on_number", unique: true, using: :btree
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_types_on_name", unique: true, using: :btree
  end

  add_foreign_key "moves", "effects"
  add_foreign_key "moves", "types"
  add_foreign_key "pokemon_moves", "move_methods"
  add_foreign_key "pokemon_moves", "moves"
  add_foreign_key "pokemon_moves", "pokemons"
  add_foreign_key "pokemon_strengths", "pokemons"
  add_foreign_key "pokemon_strengths", "types"
  add_foreign_key "pokemon_types", "pokemons"
  add_foreign_key "pokemon_types", "types"
  add_foreign_key "pokemon_weaknesses", "pokemons"
  add_foreign_key "pokemon_weaknesses", "types"
end
