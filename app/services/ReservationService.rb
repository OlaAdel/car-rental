class ReservationService
  def self.apply(availability_date, requested_from, requested_to, car_id)
    availability_dates = Array.new

    if requested_from != availability_date.available_from
      date = AvailabilityDate.new
      date.available_from = availability_date.available_from
      date.available_to = requested_from
      date.car_id = car_id
      availability_dates.push(date)
    end

    if requested_to != availability_date.available_to
      date = AvailabilityDate.new
      date.available_from = requested_to
      date.available_to = availability_date.available_to
      date.car_id = car_id
      availability_dates.push(date)
    end

    date = AvailabilityDate.new
    date.available_from = requested_from
    date.available_to = requested_to
    date.car_id = car_id
    date.reserved = true
    availability_dates.push(date)

    return availability_dates
  end
end
