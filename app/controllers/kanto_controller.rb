class KantoController < ApplicationController
  require 'net/http'
  require 'json'

  @name = "nul"
  def index
    api_service = PokeApi.new

    @region_data = api_service.get_region "kanto"
    @pokemons = Pokemon.all

    @test = api_service.get_location_pokemon_names "#{@region_data["locations"][0]["name"]}"
    @name = 'place'
  end

  def location
    name = params[:name]
    api_service = PokeApi.new
    @current_location = api_service.get_location(name)
    @current_pokemons = get_pokemons name
  end

  def get_location
    name = params[:name]
    api_service = PokeApi.new
    @current_location = api_service.get_location(name)
    render json: { location: @current_location }
  end

  def get_pokemons(name)
      api_service = PokeApi.new
      @pokemons = api_service.get_location_pokemon_names(name)
  end

  def get_pokemon_info
    name = params[:name]
    api_service = PokeApi.new
      @pokemon = api_service.get_pokemon_info(name)
      render json: { pokemon: @pokemon }
  end

    def push_pokemon
      name = params[:name] #
        api_service = PokeApi.new

        poke_data = api_service.get_pokemon_info name

        new_pokemon = Pokemon.new

        new_pokemon.name = poke_data["name"]
        new_pokemon.typePokemon = poke_data["types"][0]["type"]["name"]

        var = poke_data["stats"].find{ |e| e["stat"]["name"] == "hp"}
        new_pokemon.hp = var["base_stat"]

        var = poke_data["stats"].find{ |e| e["stat"]["name"] == "attack"}
        new_pokemon.attack = var["base_stat"]

        var = poke_data["stats"].find{ |e| e["stat"]["name"] == "hp"}
        new_pokemon.defense = var["base_stat"]

        new_pokemon.sprite = poke_data['sprites']['front_default']

        if new_pokemon.save
            flash[:success] = 'The pokemon was successfully added.'
        else
            flash[:error] = new_pokemon.errors.full_messages.join(", ")
        end
    end
end
