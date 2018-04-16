class AsteroidLookup
  def initialize(neo_id)
    @neo_id = neo_id
  end

  def run
    conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/neo/#{@neo_id}")
    response = conn.get do |req|
      req.params['api_key'] = ENV['api_key']
    end
    JSON.parse(response.body)
  end
end
