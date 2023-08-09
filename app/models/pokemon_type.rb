class PokemonType < ApplicationRecord
	# validations
	validates :pokemon, :type, presence: true
end
