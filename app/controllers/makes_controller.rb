class MakesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        render json: Make.all
    end

    def create 
        make =  Make.new(make_params)
    
        if make.save
          render json: make, status: :created
        else
          render json: make.errors, status: :unprocessable_entity
        end
    end

    def make_params
        params.require(:make).permit(:name)
    end    

end
