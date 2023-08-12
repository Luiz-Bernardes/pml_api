FactoryBot.define do
	factory :pokemon do
		number { 151 }
		name { "Mew" }
		original_name { "Mew" }
		classification { "New Species Pokémon" }
		height { 0.4 }
		weight { 4.0 }
		capture_rate { 45 }
		experience_growth { "Medium Slow" }
		experience_growth_points { 1059860 }
		region
	end
end