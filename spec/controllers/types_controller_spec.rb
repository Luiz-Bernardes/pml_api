require 'rails_helper'

RSpec.describe TypesController, type: :controller do
  it "GET /index" do
    get :index
    expect(response).to have_http_status(200)
  end

  it "GET /show" do
    type = create(:type)
    get :show, params: { id: type.id }
    expect(response).to have_http_status(200)
  end

  it "POST /create" do
    type_params = attributes_for(:type)
    expect(response).to have_http_status(200)
    expect {
      post :create, 
      params: { type: type_params }
    }.to change(Type, :count).by(1)
  end

  it "PUT /update" do
    type_params = attributes_for(:type)
    type = create(:type)
    put :update, params: { id: type.id, type: type_params  }
    expect(response).to have_http_status(200)
  end

  it "DELETE /destroy" do
    type = create(:type)
    delete :destroy, params: { id: type.id }
    expect(response).to have_http_status(204)
  end
end
