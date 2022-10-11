require 'rails_helper'

RSpec.describe 'Endpoints', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_endpoint) { FactoryBot.create(:endpoint) }

      before do
        post '/endpoints', params: {
          "data": {
            "attributes": {
              "verb": my_endpoint.verb,
              "path": my_endpoint.path,
              "response": {
                "code": 200,
                "headers": {'a': 'a'},
                "body": "\"{ \"message\": \"Hello, world\" }\""
              }
            }
          }
        }
      end

      it 'returns the verb' do
        expect(json['data']['attributes']['verb']).to eq(my_endpoint.verb)
      end

      it 'returns the path' do
        expect(json['data']['attributes']['path']).to eq(my_endpoint.path)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end

    end

    context 'with invalid parameters' do
      before do
        post '/endpoints', params: {
          "data": {
            "attributes": {
              "verb": "",
              "path": "",
              "response": {
                "code": 200,
                "headers": {},
                "body": "\"{ \"message\": \"Hello, world\" }\""
              }
            }
          }
        }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end