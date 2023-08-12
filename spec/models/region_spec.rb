require 'rails_helper'

RSpec.describe Region, type: :model do
  before(:each) do 
    @region = create(:region)
  end

  context 'Create validation' do
    it 'is expected to create object region with valid params' do
      expect(@region).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:generation) }
    it { should validate_presence_of(:games) }
    it { should validate_presence_of(:pokedex_count) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@region.name.class).to eq(String)
    end
    it 'is expected to validate that :generation class eq String' do 
      expect(@region.generation.class).to eq(String)
    end
    it 'is expected to validate that :games class eq String' do 
      expect(@region.games.class).to eq(String)
    end
    it 'is expected to validate that :pokedex_count class eq Integer' do 
      expect(@region.pokedex_count.class).to eq(Integer)
    end
  end
  
end
