require 'rails_helper'

describe "GET /user/favorites" do
  it "returns a list of favorites" do
    user = create(:user, email: "uncle.jesse@example.com", name: "Jesse Katsopolis")
    api_key = create(:api_key, value: "123abc", user: user)
    favorite = create(:favorite, neo_reference_id: 2153306, user: user)

    get "/api/v1/user/favorites?api_key=#{api_key.value}"

    results = JSON.parse(response.body)

    expect(results.first["user_id"]).to eq(user.id)
    expect(results.first["id"]).to eq(favorite.id)
    expect(results.first["neo_reference_id"]).to eq(favorite.neo_reference_id)
    expect(results.first["asteroid"].count).to eq(1)
  end
end


# As a registered user
# When I send a 'GET' request to '/api/v1/user/favorites?api_key=abc123'
# Then I should receive a JSON response as follows:
