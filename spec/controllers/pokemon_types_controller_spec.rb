require 'rails_helper'

RSpec.describe PokemonTypesController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    pokemons_type = create(:pokemons_type)
    get :show, params: { id: pokemons_type.id }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    pokemons_type = create(:pokemons_type)
    delete :destroy, params: { id: pokemons_type.id }
    expect(response).to have_http_status(204)
  end
end
