class TypeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  has_many :pokemons
end
