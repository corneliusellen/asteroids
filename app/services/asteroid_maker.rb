class AsteroidMaker

  def initialize(start_date, end_date)
    @start = start_date
    @end = end_date
    @asteroids = []
    @danger_day = []
  end

  def find_by_date
    find_most_dangerous_day
    @asteroids[@danger_day.first].map do |asteroid|
      Asteroid.new(asteroid) if asteroid["is_potentially_hazardous_asteroid"]
    end.compact
  end

  def find_most_dangerous_day
    @asteroids = AsteroidService.new(@start, @end).run
    @danger_day = find_danger_day
  end

  def find_danger_day
    days.zip(dangerous_count).to_h.min
  end

  def dangerous_count
    @asteroids.map do |date|
      date[1].count do |day|
        day["is_potentially_hazardous_asteroid"] == true
      end
    end
  end

  def days
    @asteroids.map do |date|
      date.first
    end
  end
end
