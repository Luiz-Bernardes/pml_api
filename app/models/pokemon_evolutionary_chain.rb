class PokemonEvolutionaryChain < ApplicationRecord
	# belongs associations
	belongs_to :pokemon
  belongs_to :evolutionary_chain

  # validations
	validates :pokemon, :evolutionary_chain, presence: true
end
