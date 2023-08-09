class Pokemon < ApplicationRecord
  # one to many associations
  has_many :evolutionary_chains

  # many to many associations
  has_and_belongs_to_many :types
  
  # belongs associations
  belongs_to :region

  # validations
  validates :number, :name, :region, presence: true

  def evolve_to
    ids = self.evolutionary_chains.map(&:pokemon_evolved_id)
    
    if !ids.present?
      "No Evolution"
    else
      pokemons = Pokemon.where(id: ids)
      pokemons.map(&:name)
    end
  end

end
