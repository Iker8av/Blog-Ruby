class KantoController < ApplicationController
  @name = "nul"
  def index
    api_service = PokeApi.new

    @region_data = api_service.get_region "kanto"

    @test = api_service.get_location_pokemon_names "#{@region_data["locations"][0]["name"]}"
    @name = 'place'
  end

  def location
    name = params[:name] # Get the n
    api_service = PokeApi.new
    @current_location = api_service.get_location(name) # Fetch the data based on the name
    # @name = @current_location['name']
    # render json: { location: @current_location } # Return the data as JSON
    # @current_location = get_location(name)
  end

  def get_location
    name = params[:name] # Get the n
    api_service = PokeApi.new
    @current_location = api_service.get_location(name) # Fetch the data based on the name
    render json: { location: @current_location } # Return the data as JSON
  end

end
