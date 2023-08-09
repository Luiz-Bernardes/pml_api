class ChangePokemonTypesToPokemonsTypes < ActiveRecord::Migration[6.0]
  def change
    rename_table :pokemon_types, :pokemons_types
  end
end
