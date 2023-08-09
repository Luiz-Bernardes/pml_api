# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# UML

@startuml

skin rose

title Classes - Class Diagram


class Region {
  +String name
  +String generation
  +String games
  +Int pokedex_count
}

class Pokemon {
  +Int region_id
  +Int number
  +String name
  +String original_name
  +String classification
  +Float height
  +Float weight
  +Int capture_rate
  +String experience_growth
  +Int experience_growth_points
}

class EvolutionaryChain {
  +Int pokemon_id
  +Int evolution_levelup
  +Text evolution_method
}

class PokemonEvolutionaryChain {
  +Int evolutionary_chain_id
  +Int pokemon_id
}

class Type {
  +String name
}

class PokemonType {
  +Int type_id
  +Int pokemon_id
}


Pokemon "many" *-up- "1" Region: Composition
EvolutionaryChain "many" *-up-* "many" Pokemon: Composition
Type "many" *-up-* "many" Pokemon: Composition


@enduml

# EX
rails g scaffold entity fields --no-test-framework
rails destroy scaffold entity