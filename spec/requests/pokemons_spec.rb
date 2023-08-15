require 'rails_helper'

RSpec.describe "PokemonsRequest", type: :request do
  before(:each) do 
    @pokemon = create(:pokemon)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema pokemon" do
      get "/pokemons/#{@pokemon.id}.json"
      expect(response).to match_json_schema("pokemon")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get pokemons_path
      expect(response.body).to include_json([
        number: @pokemon.number,
        name: @pokemon.name,
        region_id: @pokemon.region.id
      ])
    end

    it "show is expected response body to include json" do
      get pokemons_path(@pokemon.id)
      expect(response.body).to include_json([id: @pokemon.id])
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      pokemon_params = attributes_for(:pokemon).merge({ region_id: @pokemon.region.id})
      post "/pokemons", params: { pokemon: pokemon_params }, headers: headers
      expect(response.body).to include_json(
        id: (be_kind_of Integer),
        number: pokemon_params[:number],
        name: pokemon_params[:name],
        region_id: pokemon_params[:region_id]
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      @pokemon.name = "Nome alterado"
      patch pokemon_path(@pokemon.id) , params: { pokemon: @pokemon.attributes }, headers: headers
      expect(response.body).to include_json(
        id: @pokemon.id,
        number: @pokemon.number,
        name: @pokemon.name,
        region_id: @pokemon.region.id
      )
    end
  end

  describe "DELETE" do
    it "destroy is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      expect { 
        delete pokemon_path(@pokemon.id), headers: headers 
      }.to change(Pokemon, :count).by(-1)
    end
  end

end
