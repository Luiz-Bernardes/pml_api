class CreatePokemonTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_types do |t|
      t.integer :type_id
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
