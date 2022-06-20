class CarsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        lat = params[:lat].to_f
        lon = params[:lon].to_f
        max_distance = params[:distance].to_f

        source = Location.new(lat, lon)
        cars = Car.all
                  .filter { |car|
                      DistanceService.apply(source, Location.new(car.latitude, car.longtitude)) < max_distance
                  }
        render json: cars.map { |car| CarRepresenter.new(car).as_json }
    end

    def show
        car = Car.find(params[:id])
        render json: CarRepresenter.new(car).as_json
    rescue ActiveRecord:: RecordNotFound
        head :not_found
    end

    def create
        car = Car.new(JSON.parse(params[:data]))
        car.images.attach(params[:images])
        if car.save
            render json: CarRepresenter.new(car).as_json, status: :created
        else
          render json: car.errors, status: :unprocessable_entity
        end
    end

    def latest
        car = Car.last
        render json: CarRepresenter.new(car).as_json
    end

    def destroy
        Car.find(params[:id]).destroy!
        head :no_content
    rescue ActiveRecord:: RecordNotDestroyed
        head :unprocessable_entity
    rescue ActiveRecord:: RecordNotFound
        head :not_found
    end
end