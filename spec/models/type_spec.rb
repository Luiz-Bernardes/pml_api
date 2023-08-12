require 'rails_helper'

RSpec.describe Type, type: :model do  
  before(:each) do 
    @type = create(:type)
  end

  context 'Create validation' do
    it 'is expected to create object type with valid params' do
      expect(@type).to be_valid
    end
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
  end

  context 'Class type validations' do
    it 'is expected to validate that :name class eq String' do 
      expect(@type.name.class).to eq(String)
    end
  end
end
