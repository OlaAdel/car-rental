class ReservationsController < ApplicationController
  protect_from_forgery with: :null_session

  def make
    from = Time.zone.parse(params[:from])
    to = Time.zone.parse(params[:to])
    car_id = params[:car_id]

    availability_dates = AvailabilityDate.where('car_id = ?', car_id)
                                         .and(AvailabilityDate.available_after(to)
                                                              .and(AvailabilityDate.available_before(from)
                                                                                   .and(AvailabilityDate.not_reserved)))

    reservation = Reservation.new
    if availability_dates.present?
      updated_availability_dates = ReservationService.apply(availability_dates.first, from, to, car_id)
      updated_availability_dates.each do |date|
        puts date.class
        date.save
      end
      availability_dates.first.destroy!
      availability_date_id = updated_availability_dates.last.id
      reservation.availability_date_id = availability_date_id
      if reservation.save
        render json: reservation, status: :created
      else
        render json: reservation.errors, status: :unprocessable_entity
      end
    else
      head :unprocessable_entity
    end

  end

end
