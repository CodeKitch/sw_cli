class StarWarsPlanetsCli::CLI

    def call
        puts "\nWelcome To The 'Star Wars' Planet Information System:"
        API.pulled_data
        self.menu
    end

    def menu
        puts "\nWould you like to learn more about 'Star Wars' Planets?"
        puts "Confirm by typing 'yes' to continue or try any other key to eject."
        puts "\n"
        input = gets.strip.downcase
        if input == "yes" || input == "y"
            selection
        else input == "exit"
            exit
        end
    end

    def selection
        puts "\nTo List Planets, Please Type 'planets' "
        puts "To Exit The System, Please Type 'exit' "
        puts "\n"
        input = gets.strip.downcase
        if input == "planets"
            puts ""
            planets_list
            planet_choice
        elsif input == "exit"
            outtahere
        else
            invalid_entry
        end
    end

    def planets_list
        prompt
        puts"\n"
        Planet.all.each.with_index(1) do |planet, index|
            puts "#{index}. #{planet.name}"
        end
        puts"\n"
    end

    def planet_choice
        # index = gets.strip.to_i - 1
        # max_planets = Planet.all.length - 1
        # until index.between?(0,max_planets)
        #     puts "That's not a choice; try again!"
        #     index = gets.strip.to_i - 1
        # end
        # planet_choosen = Planet.all[index]
        # planet_selection(planet_choosen)
    
        input = gets.strip.downcase 
        enter_name
        planet_selection(input)
    end
 
    def planet_selection(planet)
        p = Planet.find_by_name(planet)
        p.each do |plnet|
        puts "\n Name: #{plnet.name}"
        puts " Diameter: #{plnet.diameter}"
        puts " Population: #{plnet.population}"
        puts " Climate: #{plnet.climate}"
        puts " Terrain: #{plnet.terrain}"
        puts " Rotation Period: #{plnet.rotation_period}"
        puts " Orbital Period: #{plnet.orbital_period}"
        end
        selection
    end

    def enter_name
        puts "\nPlease type the exact 'name' of your choice."
    end

    def prompt
        puts "\nPlease 'enter name' of the planet you would like to learn about."
    end

    def exit
            puts "\n \"Do. Or do not. There is no try.\" "
            puts "\n"
    end

    def outtahere
            puts "\nMAY THE FORCE BE WITH YOU"
            puts "\n"
    end
    
    def invalid_entry
            puts  "\nInvalid entry, try again"
            selection
    end
end
