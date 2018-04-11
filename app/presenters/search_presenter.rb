class SearchPresenter

  def initialize(dates)
    @start = dates["start_date"]
    @end = dates["end_date"]
  end

  def start_date
    @start.to_date
  end

  def end_date
    @end.to_date
  end

  def asteroids
    AsteroidMaker.new(@start, @end).find_by_date
  end
end
