class EvolutionaryChain < ApplicationRecord
  # mono-transitive many to many associations
  has_many :pokemon_evolutionary_chains
  has_many :pokemons, through: :pokemon_evolutionary_chains
  
  # belongs associations
  belongs_to :pokemon

  # validations
  validates :pokemon, presence: true
end
