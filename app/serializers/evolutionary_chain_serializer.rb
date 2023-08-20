class EvolutionaryChainSerializer
  include FastJsonapi::ObjectSerializer
  attributes :pokemon_id, :pokemon_evolved_id, :evolution_levelup, :evolution_method
end
