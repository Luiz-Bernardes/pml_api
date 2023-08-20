class AddUrlImageToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :url_image, :string
  end
end
