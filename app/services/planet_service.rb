class PlanetService
    def index
        planets = Planet.all
        if planets.any?
            planets
        else
            "no planets in this galaxy"
        end
    end

    def show(id)
        planet = Planet.find_by(id: id)
        if planet.present?
            planet
        else
            "No information available"
        end
    end

    def create(params)
        planet_param = params.require(:planet).permit(:name,:position)
        if Planet.exists?(name: planet_param[:name])
            return "Planet already exists"
        else
            planet = Planet.new(planet_param)

            if planet.save
                planet
            else
                "Error in creating this planet"
            end
        end
    end

    def create_bulk(params)
        res =[]
        planets_data = params.require(:planet)
        planets_data.each do |planet_param|
            if Planet.exists?(name: planet_param[:name])
                res << "Planet #{planet_param[:name]} exists already"
            else
                new_planet = Planet.new(planet_param.permit(:name,:position))
                if new_planet.save
                    res << "Planet #{planet_param[:name]} created successfully"
                else
                    res << "Planet #{planet_param[:name]} creation failed"
                end
            end  
        end    
        res
    end

    def update(params)
        upd_planet = Planet.find_by(id: params[:id])
        if upd_planet
            planet_param = params.require(:planet).permit(:name,:position)
            upd_planet.update(planet_param)
            upd_planet
        else
            "No such planet exists in this galaxy, Try again?"
        end
    end

    def delete(params)
        del_planet = Planet.find_by(id: params[:id])
        if del_planet
            del_planet.destroy
        else
            "No such planet exists in this galaxy, Try again?"
        end
    end
    
end