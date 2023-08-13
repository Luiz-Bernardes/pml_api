require 'rails_helper'

RSpec.describe EvolutionaryChainsController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    evolutionary_chain = create(:evolutionary_chain)
    get :show, params: { id: evolutionary_chain.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    pokemon = create(:pokemon)
    evolutionary_chain_params = attributes_for(:evolutionary_chain).merge({ pokemon_id: pokemon.id})
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { evolutionary_chain: evolutionary_chain_params}
    }.to change(EvolutionaryChain, :count).by(1)
  end

  it "PUT /update" do
    pokemon = create(:pokemon)
    evolutionary_chain_params = attributes_for(:evolutionary_chain).merge({ pokemon_id: pokemon.id})
    evolutionary_chain = create(:evolutionary_chain)
    put :update, params: { id: evolutionary_chain.id, evolutionary_chain: evolutionary_chain_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    evolutionary_chain = create(:evolutionary_chain)
    put :destroy, params: { id: evolutionary_chain.id }
    expect(response).to have_http_status(204)
  end
end
