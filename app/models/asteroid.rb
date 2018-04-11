class Asteroid
  attr_reader :name,
              :neo_reference

  def initialize(info)
    @name = info["name"]
    @neo_reference = info["neo_reference_id"]
  end
end
