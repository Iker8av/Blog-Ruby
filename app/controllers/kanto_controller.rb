class KantoController < ApplicationController
  def index
    api_service = PokeApi.new

    @region_data = api_service.get_region "kanto"
    @location_data = api_service.get_location "#{@region_data["locations"][0]["name"]}"

    @test = api_service.get_location_pokemon_names "#{@region_data["locations"][0]["name"]}"
  end
end
