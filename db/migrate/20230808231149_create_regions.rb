class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :generation
      t.string :games
      t.integer :pokedex_count

      t.timestamps
    end
  end
end
