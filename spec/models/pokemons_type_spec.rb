require 'rails_helper'

RSpec.describe PokemonsType, type: :model do
  before(:each) do 
    @pokemons_type = create(:pokemons_type)
  end

  context 'Create validation' do
    it 'is expected to create object pokemons type with valid params' do
      expect(@pokemons_type).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:pokemon) }
    it { should validate_presence_of(:type) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :pokemon class eq Pokemon' do 
      expect(@pokemons_type.pokemon.class).to eq(Pokemon)
    end
    it 'is expected to validate that :type class eq Type' do 
      expect(@pokemons_type.type.class).to eq(Type)
    end
  end

  context 'Association validations' do
    it { should belong_to(:pokemon) }
    it { should belong_to(:type) }
  end
end
