class PokemonSerializer
  include FastJsonapi::ObjectSerializer
  attributes :region_id, :number, :name, :original_name, :classification, :height, :weight, :capture_rate, :experience_growth, :experience_growth_points

  has_many :evolutionary_chains
  has_many :types
end
