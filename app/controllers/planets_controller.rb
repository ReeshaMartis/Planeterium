class PlanetsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        p = PlanetService.new
        planets = p.index
        render json: planets
    end

    def show
        p = PlanetService.new
        planet = p.show(params[:id])
        render json: planet
    end

    def create
        puts "Params: #{params.inspect}"   # check what Rails is receiving
        p = PlanetService.new
        created = p.create(params)

        if created.is_a?(Planet)
            render json: created, status: :created
        else
            render json: {error: created},status: :unprocessable_entity
        end
    end

    def update
        p= PlanetService.new
        updated = p.update(params)
        if updated.is_a?(Planet)
            render json: updated, status: :ok
        else
            render json: {error: updated},status: :not_found
        end
    end

    def destroy
        p= PlanetService.new
        deleted = p.delete(params)
         if deleted.is_a?(Planet)
            render json: "Planet deleted successfully", status: :ok
        else
            render json: {error: deleted},status: :not_found
        end
    end
        



end
