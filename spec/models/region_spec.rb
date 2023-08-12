require 'rails_helper'

RSpec.describe Region, type: :model do
  
  it 'create valid region' do
    region = create(:region)
    expect(region).to be_valid
  end

  context 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:generation) }
    it { should validate_presence_of(:games) }
    it { should validate_presence_of(:pokedex_count) }
  end
end
