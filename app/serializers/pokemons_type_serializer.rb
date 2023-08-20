class PokemonsTypeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :type_id, :pokemon_id
end
