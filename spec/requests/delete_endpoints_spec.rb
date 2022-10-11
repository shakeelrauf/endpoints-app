require 'rails_helper'

RSpec.describe 'Endpoints', type: :request do
  describe "DELETE /endpoins/:id" do
    let!(:endpoint) { FactoryBot.create(:endpoint) }

    before do
      delete "/endpoints/#{endpoint.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end