class Planet
    attr_accessor :name, :diameter, :population, :climate, :terrain, :rotation_period, :orbital_period

    @@all = []

    def initialize(attr_hash)
        attr_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.select do |planet|
            planet.name.downcase == name
        end
    end
end