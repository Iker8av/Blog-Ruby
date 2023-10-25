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
  end