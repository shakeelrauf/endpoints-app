require 'rails_helper'

RSpec.describe "Endpoints", type: :request do
  describe "GET /index" do
    before do
      FactoryBot.create_list(:endpoint, 10)
      get '/endpoints'
    end
    
    it 'returns all endpoints' do
      expect(json['data'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
