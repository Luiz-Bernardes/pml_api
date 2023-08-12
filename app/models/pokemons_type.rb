class PokemonsType < ApplicationRecord
	# belongs associations
	belongs_to :pokemon
	belongs_to :type

	# validations
  validates :pokemon, :type, presence: true
end
