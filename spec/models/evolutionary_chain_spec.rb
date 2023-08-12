require 'rails_helper'

RSpec.describe EvolutionaryChain, type: :model do
  before(:each) do 
    @evolutionary_chain = create(:evolutionary_chain)
  end

  context 'Create validation' do
    it 'is expected to create object evolutionary_chain with valid params' do
      expect(@evolutionary_chain).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:pokemon) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :pokemon class eq Pokemon' do 
      expect(@evolutionary_chain.pokemon.class).to eq(Pokemon)
    end
  end

  context 'Association validations' do
    it { should belong_to(:pokemon) }
  end
end
