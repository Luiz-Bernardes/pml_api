require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    region = create(:region)
    get :show, params: { id: region.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    region_params = attributes_for(:region)
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { region: region_params }
    }.to change(Region, :count).by(1)
  end

  it "PUT /update" do
    region_params = attributes_for(:region)
    region = create(:region)
    put :update, params: { id: region.id, region: region_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    region = create(:region)
    put :destroy, params: { id: region.id }
    expect(response).to have_http_status(204)
  end
end
