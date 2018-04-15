class Api::V1::User::FavoritesController < ApiBaseController

  def index
    render json: current_user.favorites, each_serializer: FavoriteSerializer
  end

  def create
    current_user.favorites << Favorite.create(
      neo_reference_id: request.env["neo_reference_id"])
    render json: current_user.favorites.last, serializer: FavoredSerializer
  end
end
