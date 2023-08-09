class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.references :region, null: false, foreign_key: true
      t.integer :number
      t.string :name
      t.string :original_name
      t.string :classification
      t.float :height
      t.float :weight
      t.integer :capture_rate
      t.string :experience_growth
      t.integer :experience_growth_points

      t.timestamps
    end
  end
end
