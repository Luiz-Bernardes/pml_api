FactoryBot.define do
	factory :evolutionary_chain do
		evolution_levelup { 16 }
		evolution_method { "Stone" }
		pokemon_evolved_id { nil }
		pokemon
	end
end