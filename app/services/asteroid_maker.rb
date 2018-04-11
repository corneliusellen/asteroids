class AsteroidMaker

  def initialize(start_date, end_date)
    @start = start_date
    @end = end_date
    @asteroids = []
  end

  def find_by_date
    rocks = AsteroidService.new(@start, @end)
    @asteroids = rocks.run
    danger = find_most_dangerous_day
    @asteroids[danger.first].map do |asteroid|
      Asteroid.new(asteroid) if asteroid["is_potentially_hazardous_asteroid"]
    end.compact
  end

  def find_most_dangerous_day
    dangerous_count = @asteroids.map do |date|
      date[1].count do |day|
        day["is_potentially_hazardous_asteroid"] == true
      end
    end

    days = @asteroids.map do |date|
      date.first
      end

    hash = days.zip(dangerous_count).to_h
    hash.min
  end
end

class AsteroidService
  def initialize(start_date, end_date)
    @start = start_date
    @end = end_date
  end

  def run
    conn = Faraday.new("https://api.nasa.gov/neo/rest/v1/feed")
    response = conn.get do |req|
      req.params['start_date'] = @start
      req.params['end_date'] = @end
      req.params['detailed'] = "false"
      req.params['api_key'] = ENV['api_key']
    end
   JSON.parse(response.body)["near_earth_objects"]
  end
end
