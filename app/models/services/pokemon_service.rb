class PokemonService
	def self.find(number)
		Pokemon.find_by(number: number)
	end

	def self.search(numbers)
		Pokemon.where(number: numbers)
	end
end