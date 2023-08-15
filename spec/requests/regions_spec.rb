require 'rails_helper'

RSpec.describe "Regions", type: :request do
  before(:each) do 
    @region = create(:region)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema region" do
      get "/regions/#{@region.id}.json"
      expect(response).to match_json_schema("region")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get regions_path
      expect(response.body).to include_json([
        name: @region.name,
        generation: @region.generation,
        games: @region.games,
        pokedex_count: @region.pokedex_count
      ])
    end

    it "show is expected response body to include json" do
      get regions_path(@region.id)
      expect(response.body).to include_json([id: @region.id])
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      region_params = attributes_for(:region)
      post "/regions", params: { region: region_params }, headers: headers
      expect(response.body).to include_json(
        id: (be_kind_of Integer),
        name: region_params[:name],
        generation: region_params[:generation],
        games: region_params[:games],
        pokedex_count: region_params[:pokedex_count]
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      @region.name = "Nome alterado"
      patch region_path(@region.id) , params: { region: @region.attributes }, headers: headers
      expect(response.body).to include_json(
        id: @region.id,
        name: @region.name,
        generation: @region.generation,
        games: @region.games,
        pokedex_count: @region.pokedex_count
      )
    end
  end

  describe "DELETE" do
    it "destroy is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      expect { 
        delete region_path(@region.id), headers: headers 
      }.to change(Region, :count).by(-1)
    end
  end

end
