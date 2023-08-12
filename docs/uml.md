# UML - https://www.planttext.com/

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
  +Int pokemon_evolved_id
  +Int evolution_levelup
  +Text evolution_method
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