class AvailabilityDatesController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    availability_date =  AvailabilityDate.new(availability_date_params)
    if availability_date.save
      render json: availability_date, status: :created
    else
      render json: availability_date.errors, status: :unprocessable_entity
    end
  end

  def availability_date_params
    params.require(:availability_date).permit(:available_from, :available_to, :car_id)
  end

end
