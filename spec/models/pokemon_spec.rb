require 'rails_helper'

RSpec.describe Pokemon, type: :model do  
  before(:each) do 
    @pokemon = create(:pokemon)
  end

  context 'Create validation' do
    it 'is expected to create object pokemon with valid params' do
      expect(@pokemon).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:region) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :number class eq Integer' do 
      expect(@pokemon.number.class).to eq(Integer)
    end
    it 'is expected to validate that :name class eq String' do 
      expect(@pokemon.name.class).to eq(String)
    end
    it 'is expected to validate that :region class eq Region' do 
      expect(@pokemon.region.class).to eq(Region)
    end
  end

  context 'Association validations' do
    it { should belong_to(:region) }
  end
end
