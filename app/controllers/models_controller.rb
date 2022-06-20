class ModelsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        render json: Model.all
    end

    def create 
        model =  Model.new(model_params)
        if model.save
          render json: model, status: :created
        else
          render json: model.errors, status: :unprocessable_entity
        end
    end

    def model_params
        params.require(:model).permit(:name, :make_id)
    end    

end
