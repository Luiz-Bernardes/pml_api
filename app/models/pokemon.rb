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
      pokemons = PokemonService.search(ids)
      pokemons.map(&:name)
    end
  end

  def evolve_through
    evolve_list = []
    self.evolutionary_chains.each do |evolutionary_chain|
      level = evolutionary_chain.evolution_levelup
      evo_method = evolutionary_chain.evolution_method
      level.present? ? evolve_list.push(level) : evolve_list(evo_method)
    end

    evolve_list
  end

  def type_names
    self.types.map(&:name)
  end

end
