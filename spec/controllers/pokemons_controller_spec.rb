require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    pokemon = create(:pokemon)
    get :show, params: { id: pokemon.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    region = create(:region)
    pokemon_params = attributes_for(:pokemon).merge({ region_id: region.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { pokemon: pokemon_params}
    }.to change(Pokemon, :count).by(1)
  end

  it "PUT /update" do
    region = create(:region)
    pokemon_params = attributes_for(:pokemon).merge({ region_id: region.id})
    pokemon = create(:pokemon)
    put :update, params: { id: pokemon.id, pokemon: pokemon_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    pokemon = create(:pokemon)
    put :destroy, params: { id: pokemon.id }
    expect(response).to have_http_status(204)
  end
end
