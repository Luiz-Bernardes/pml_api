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

ActiveRecord::Schema.define(version: 2023_08_09_154642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evolutionary_chains", force: :cascade do |t|
    t.bigint "pokemon_id", null: false
    t.integer "evolution_levelup"
    t.text "evolution_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_evolutionary_chains_on_pokemon_id"
  end

  create_table "pokemon_evolutionary_chains", force: :cascade do |t|
    t.integer "evolutionary_chain_id"
    t.integer "pokemon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.integer "type_id"
    t.integer "pokemon_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.bigint "region_id", null: false
    t.integer "number"
    t.string "name"
    t.string "original_name"
    t.string "classification"
    t.float "height"
    t.float "weight"
    t.integer "capture_rate"
    t.string "experience_growth"
    t.integer "experience_growth_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_pokemons_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "generation"
    t.string "games"
    t.integer "pokedex_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "evolutionary_chains", "pokemons"
  add_foreign_key "pokemons", "regions"
end
