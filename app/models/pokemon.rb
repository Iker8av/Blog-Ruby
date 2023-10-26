class Pokemon < ApplicationRecord
    require 'net/http'
    require 'json'

    def self.push_pokemon(name)
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
        
        new_pokemon.created_at = Time.now

        puts new_pokemon.name

        if new_pokemon.save
            flash[:success] = 'The pokemon was successfully added.'
        else
            flash[:error] = new_pokemon.errors.full_messages.join(", ")
        end
    end

    def self.pop_last
        last_poke = Pokemon.last

        if last_poke
        last_poke.destroy
        puts "Successfully removed the last inserted book with ID #{last_poke.id}."
        else
        puts "No records found in the table."
        end
    end
end
