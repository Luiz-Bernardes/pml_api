class Pokemon < ApplicationRecord
  # mono-transitive many to many associations
  has_many :pokemon_evolutionary_chains
  has_many :evolutionary_chains, through: :pokemon_evolutionary_chains

  # many to many associations
  has_and_belongs_to_many :types
  
  # belongs associations
  belongs_to :region

  # validations
  validates :number, :name, :region, presence: true
end
