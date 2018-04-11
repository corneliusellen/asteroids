class MostDangerousDayController < ApplicationController
  def index
    @search = SearchPresenter.new(params)
  end
end
