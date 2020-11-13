class API
    
    def self.pulled_data
        response = RestClient.get("https://swapi.dev/api/planets")
        planets_pull = JSON.parse(response.body)["results"]
        planets_pull.each do |planet|
            Planet.new(planet)
        end
    end
end