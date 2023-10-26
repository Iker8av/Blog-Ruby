require 'httparty'

class PokeApi
    include HTTParty
  
    base_uri 'https://pokeapi.co/api/v2'
  
    def get_region(name)
      response = self.class.get("/region/#{name}")
      if response.success?
        response.parsed_response
      else
        raise "API request failed with status code #{response.code}"
      end
    end

    def get_location(name)
      response = self.class.get("/location/#{name}")
      if response.success?
        response.parsed_response
      else
        raise "API request failed with status code #{response.code}"
      end
    end

    def get_location_pokemon_names(name)
        location = self.class.get("/location/#{name}")
        if location.success?
            location.parsed_response
            res = {}

            location["areas"].each do |e|
                location_area = self.class.get("/location-area/#{e["name"]}")

                if location_area.success?
                    location_area.parsed_response
                    location_area["pokemon_encounters"].each do |p|
                        res[p["pokemon"]["name"]] = get_pokemon_info p["pokemon"]["name"]
                    end
                end
            end

            p res
          else
            raise "API request failed with status code #{response.code}"
          end
    end

    def get_pokemon_info(name)
      response = self.class.get("/pokemon/#{name}")
      if response.success?
        response.parsed_response
      else
        raise "API request failed with status code #{response.code}"
      end
    end
  end