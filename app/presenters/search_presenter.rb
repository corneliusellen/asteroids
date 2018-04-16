class SearchPresenter

  def initialize(dates)
    @start = dates["start_date"]
    @end = dates["end_date"]
  end

  def start_date
    Time.parse(@start).strftime("%B %d, %Y")
  end

  def end_date
    Time.parse(@end).strftime("%B %d, %Y")
  end

  def asteroids
    asteroids ||= AsteroidMaker.new(@start, @end).find_by_date
  end
end
