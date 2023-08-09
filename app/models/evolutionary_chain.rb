class EvolutionaryChain < ApplicationRecord
  # belongs associations
  belongs_to :pokemon

  # validations
  validates :pokemon, presence: true
end
