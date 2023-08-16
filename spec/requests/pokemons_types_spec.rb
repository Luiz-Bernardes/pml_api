require 'rails_helper'

RSpec.describe "PokemonsTypesRequest", type: :request do
  before(:each) do 
    @pokemons_type = create(:pokemons_type)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema pokemons_type" do
      get "/pokemon_types/#{@pokemons_type.id}.json"
      expect(response).to match_json_schema("pokemons_type")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get pokemon_types_path
      expect(response.body).to include_json([
        pokemon_id: @pokemons_type.pokemon.id,
        type_id: @pokemons_type.type.id
      ])
    end

    it "show is expected response body to include json" do
      get pokemon_types_path(@pokemons_type.id)
      expect(response.body).to include_json([id: @pokemons_type.id])
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      pokemons_type_params = attributes_for(:pokemons_type).merge({ 
        pokemon_id: @pokemons_type.pokemon.id}).merge({
        type_id: @pokemons_type.type.id })
      post "/pokemon_types", params: { pokemons_type: pokemons_type_params }, headers: headers
      expect(response.body).to include_json(
        id: (be_kind_of Integer),
        pokemon_id: pokemons_type_params[:pokemon_id],
        type_id: pokemons_type_params[:type_id],
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      patch pokemon_type_path(@pokemons_type.id) , params: { pokemons_type: @pokemons_type.attributes }, headers: headers
      expect(response.body).to include_json(
        id: @pokemons_type.id,
        pokemon_id: @pokemons_type.pokemon.id,
        type_id: @pokemons_type.type.id,
      )
    end
  end

  describe "DELETE" do
    it "destroy is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      expect { 
        delete pokemon_type_path(@pokemons_type.id), headers: headers 
      }.to change(PokemonsType, :count).by(-1)
    end
  end

end
