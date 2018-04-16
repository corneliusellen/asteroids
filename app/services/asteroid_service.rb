class AsteroidService
  def initialize(start_date, end_date)
    @start = Time.parse(start_date).strftime("%Y-%m-%d")
    @end = Time.parse(end_date).strftime("%Y-%m-%d")
  end

  def run
    response = conn.get do |req|
      req.params['start_date'] = @start
      req.params['end_date'] = @end
      req.params['api_key'] = ENV['api_key']
    end
   JSON.parse(response.body)["near_earth_objects"]
  end

  private

  def conn
    Faraday.new("https://api.nasa.gov/neo/rest/v1/feed")
  end
end
