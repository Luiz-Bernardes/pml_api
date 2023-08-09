class PokemonService
	def self.find(id)
		Pokemon.find_by(id: id)
	end

	def self.search(ids)
		Pokemon.where(id: ids)
	end
end