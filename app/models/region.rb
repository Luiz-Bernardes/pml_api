class Region < ApplicationRecord
	validates :name, :generation, :games, :pokedex_count, presence: true
end
