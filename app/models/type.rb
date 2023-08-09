class Type < ApplicationRecord
	# many to many associations
	has_and_belongs_to_many :pokemons

	# validations
	validates :name, presence: true
end
