class CreatePokemonEvolutionaryChains < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_evolutionary_chains do |t|
      t.integer :evolutionary_chain_id
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
