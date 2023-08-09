class Region < ApplicationRecord
	# has many associations
	has_many :pokemons
	
	# validations
	validates :name, :generation, :games, :pokedex_count, presence: true
end
