require 'rails_helper'

RSpec.describe "EvolutionaryChainsRequest", type: :request do
  before(:each) do 
    @evolutionary_chain = create(:evolutionary_chain)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema evolutionary_chain" do
      get "/evolutionary_chains/#{@evolutionary_chain.id}.json"
      expect(response).to match_json_schema("evolutionary_chain")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get evolutionary_chains_path
      expect(response.body).to include_json([
        pokemon_id: @evolutionary_chain.pokemon.id,
        pokemon_evolved_id: nil,
        evolution_levelup: @evolutionary_chain.evolution_levelup,
        evolution_method: @evolutionary_chain.evolution_method
      ])
    end

    it "show is expected response body to include json" do
      get evolutionary_chains_path(@evolutionary_chain.id)
      expect(response.body).to include_json([id: @evolutionary_chain.id])
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      evolutionary_chain_params = attributes_for(:evolutionary_chain).merge({ pokemon_id: @evolutionary_chain.pokemon.id})
      post "/evolutionary_chains", params: { evolutionary_chain: evolutionary_chain_params }, headers: headers
      expect(response.body).to include_json(
        id: (be_kind_of Integer),
        pokemon_id: evolutionary_chain_params[:pokemon_id],
        pokemon_evolved_id: evolutionary_chain_params[:pokemon_evolved_id],
        evolution_levelup: evolutionary_chain_params[:evolution_levelup],
        evolution_method: evolutionary_chain_params[:evolution_method]
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      @evolutionary_chain.pokemon_evolved_id = 16
      patch evolutionary_chain_path(@evolutionary_chain.id) , params: { evolutionary_chain: @evolutionary_chain.attributes }, headers: headers
      expect(response.body).to include_json(
        id: @evolutionary_chain.id,
        pokemon_id: @evolutionary_chain.pokemon.id,
        pokemon_evolved_id: @evolutionary_chain.pokemon_evolved_id,
        evolution_levelup: @evolutionary_chain.evolution_levelup,
        evolution_method: @evolutionary_chain.evolution_method
      )
    end
  end

  describe "DELETE" do
    it "destroy is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      expect { 
        delete evolutionary_chain_path(@evolutionary_chain.id), headers: headers 
      }.to change(EvolutionaryChain, :count).by(-1)
    end
  end

end
