class InfoService
    def index
        all_info = PlanetInfo.all
        if all_info.any?
            all_info
        else
            "No information available"
        end
    end
    def show(params)
        index = params[:id]
        info = PlanetInfo.find_by(planet_id: index)
        if info.any?
            return info
        else
            return "No information available"
        end
    end
    def create(params)
        info_param = params.require(:planet_info).permit(:information,:planet_id)
        if PlanetInfo.exists?(information: info_param[:information])
            "This info was already added"
        else
            info= PlanetInfo.new(info_param)
            if info.save
                info
            else
                "Error in saving"
            end
        end
    end

    def update(params)
        info = PlanetInfo.find_by(id: params[:id])
        if info
            info_param = params.require(:planet_info).permit(:information,:planet_id)
            info.update(info_param)
            info
        else
            "Error updating"
        end
    end
    def delete(params)
        info = PlanetInfo.find_by(id: params[:id])
        if info
            info.destroy
        else
            "Error Deleting"
        end
    end
    def create_bulk(params)
        res =[]
        info_data = params.require(:planet_info)
        info_data.each do |info_param|
            if PlanetInfo.exists?(information: info_param[:information])
                    res << "this info #{info_param[:information]} already exists"
            else
                new_info= PlanetInfo.new(info_param.permit(:information,:planet_id))
                if new_info.save
                    res << "Planet info #{info_param[:information]} created successfully"
                else
                    res << "Planet info #{info_param[:information]} creation failed"
                end
            end
        end
        res
    end
end