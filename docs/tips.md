# EX
rails g scaffold entity fields --no-test-framework
rails destroy scaffold entity

# mono-transitive many to many associations
has_many :pokemon_evolutionary_chains
has_many :pokemons, through: :pokemon_evolutionary_chains

# Rspec
rails g rspec:model entity