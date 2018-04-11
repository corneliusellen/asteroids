class Api::V1::User::FavoritesController < ApiBaseController

  def index
    render json: current_user.favorites, each_serializer: FavoriteSerializer
  end
end
