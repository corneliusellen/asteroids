require 'rails_helper'

describe "POST /user/favorites" do
  it "returns a list of favorites" do
    user = create(:user, email: "uncle.jesse@example.com", name: "Jesse Katsopolis")
    api_key = create(:api_key, value: "123abc", user: user)
    create(:favorite, neo_reference_id: 2153306, user: user)

    headers = {"neo_reference_id" => "2021277"}
    post "/api/v1/user/favorites?api_key=#{api_key.value}", headers: headers

    results = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(results).to be_a Hash
    expect(results["user_id"]).to eq(user.id)
    expect(results["neo_reference_id"]).to eq("2021277")
    expect(results["asteroid"]["name"]).to eq("21277 (1996 TO5)")
  end
end
