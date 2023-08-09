class PokemonsType < ApplicationRecord
	# validations
  validates :pokemon_id, :type_id, presence: true
end
