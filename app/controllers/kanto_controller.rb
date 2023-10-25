class KantoController < ApplicationController
  def index
    api_service = PokeApi.new

    @region_data = api_service.get_region "kanto"
  end
end
