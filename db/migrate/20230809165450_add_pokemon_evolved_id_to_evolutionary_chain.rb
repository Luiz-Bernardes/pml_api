class AddPokemonEvolvedIdToEvolutionaryChain < ActiveRecord::Migration[6.0]
  def change
    add_column :evolutionary_chains, :pokemon_evolved_id, :integer
  end
end
