class FavoredSerializer < ActiveModel::Serializer
  attributes :id, :neo_reference_id, :user_id, :asteroid

  def asteroid
    asteroid = AsteroidLookup.new(object.neo_reference_id).run
    {"name": "#{asteroid["name"]}", "is_potentially_hazardous_asteroid": "#{asteroid["is_potentially_hazardous_asteroid"]}"}
  end
end
