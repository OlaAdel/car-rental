include Rails.application.routes.url_helpers

class CarRepresenter

  def initialize(car)
    @car = car
  end

  def as_json
    {
      id: car.id,
      make: car.model.make.name,
      model: car.model.name,
      lat: car.latitude,
      lon: car.longtitude,
      traveled_distance: car.kilometers_traveled,
      images: car.images.map do |image|
        Rails.application.routes.url_helpers.url_for(image)
      end,
      availability_dates: car.availability_dates.sort_by{ |date| date.available_from }.map do |date|
        {
          available_from: date.available_from,
          available_to: date.available_to,
          reserved: date.reserved
        }
      end
    }
  end

  private
  attr_reader :car
end