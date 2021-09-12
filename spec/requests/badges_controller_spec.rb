require 'rails_helper'

RSpec.describe "BadgesControllers", type: :request do
  describe "GET /submit" do
    it 'returns 200 status code' do
      get '/submit'
      expect(response.code).to eq("200")
    end
  end

  describe 'POST create' do
    context 'happy path' do
      let(:valid_params) do
        {
          badge_issue_date: '2021-09-12 18:38:00',
          recipient_name: 'Grzegorz Brzeczyszczykiewicz',
          uuid: '6cc75c07-1f40-41bf-ab86-8aaec6d56892'
        }
      end

      let(:new_badge) { Badge.new }
      let(:client) { ChainpointClient.new(new_badge)  }
      let(:client_response) do
        {
          "meta"=>{
            "hash_received"=>"2021-09-12T15:25:07Z",
            "processing_hints"=>{"cal"=>"2021-09-12T15:27:00Z", "btc"=>"2021-09-12T17:25:07Z"}
          },
          "hashes"=>[
            {
              "proof_id"=>"9cb94350-13dd-11ec-8ef4-01210c98ce37",
              "hash"=>"8aecb9394b6942776072f73f97641db9d950ff16a679b2473a52dbf16256c566"
            }
          ]
        }.to_json
      end

      before :each do
        stub_request(:post, "http://3.136.178.15/hashes").
           with(
             body: "{\"hashes\":[\"175d5515dc98f43709870d0b47870537bde722876d3db6883feaff374a221c05\"]}",
             headers: {
            'Content-Type'=>'application/json'
             }).
           to_return(status: 200, body: client_response, headers: {'Content-Type'=>'application/json'})
      end

      it 'returns redirect status code ' do
        post '/create', params: { badge:  valid_params }
        expect(response.code).to eq('302')
      end

      it 'creates a new badge record' do
        expect { post '/create', params: { badge:  valid_params } }.to change { Badge.all.count }.by(1)
      end

      it 'saves proper values from the external service' do
        post '/create', params: { badge:  valid_params }
        expect(Badge.find_by(hash_id_node: JSON.parse(client_response)["hashes"].first["proof_id"])).to be_truthy
        expect(Badge.find_by(return_hash: JSON.parse(client_response)["hashes"].first["hash"])).to be_truthy
      end
    end
  end

  describe 'GET success' do
    context 'when the badge is not found' do
      it 'returns 404 status' do
        id = Badge.last&.id || 1
        get "/success/#{id}"
        expect(response.code)
      end
    end
  end
end
