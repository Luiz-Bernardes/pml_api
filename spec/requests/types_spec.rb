require 'rails_helper'

RSpec.describe "TypesRequest", type: :request do
  before(:each) do 
    @type = create(:type)
  end

  describe "JSON Schema " do
    it "json is expected to match json schema type" do
      get "/types/#{@type.id}.json"
      expect(response).to match_json_schema("type")
    end
  end

  describe "GET" do
    it "index is expected response body to include json" do
      get types_path
      expect(response.body).to include_json([
        name: @type.name
      ])
    end

    it "show is expected response body to include json" do
      get types_path(@type.id)
      expect(response.body).to include_json([id: @type.id])
    end 
  end

  describe "POST" do
    it "create is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      type_params = attributes_for(:type)
      post "/types", params: { type: type_params }, headers: headers
      expect(response.body).to include_json(
        id: (be_kind_of Integer),
        name: type_params[:name]
      )
    end
  end

  describe "PATCH" do
    it "update is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      @type.name = "Tipo alterado"
      patch type_path(@type.id) , params: { type: @type.attributes }, headers: headers
      expect(response.body).to include_json(
        id: @type.id,
        name: @type.name
      )
    end
  end

  describe "DELETE" do
    it "destroy is expected response body to include json" do
      headers = { "ACCEPT" => "application/json" }
      expect { 
        delete type_path(@type.id), headers: headers 
      }.to change(Type, :count).by(-1)
    end
  end

end
