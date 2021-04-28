require 'rails_helper'

RSpec.describe "Pgps", type: :request do
  #describe "GET /index" do
  #  pending "add some examples (or delete) #{__FILE__}"
  #end
  describe "POST /pgp/sign" do
    it 'signs and returns proper output' do 
      headers = {'Content-type': 'application/json'}
      post '/pgp/sign', params: {text: 'Hello world', key: '44D05643E39145427702E1E7FEBAD7FFD041BBA1'}.to_json, headers: headers
      parsed = JSON.parse(response.body)
      expect(parsed.keys == ["signed"])
      expect(parsed["signed"].start_with?("-----BEGIN PGP SIGNED MESSAGE-----\nHash: SHA256\n\nHello world\n-----BEGIN PGP SIGNATURE-----"))
      expect(parsed["signed"].end_with?("\n-----END PGP SIGNATURE-----\n"))
    end
  end
end
