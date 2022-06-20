class DistanceService
  def self.apply(source, destination)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm         = 6371          # Earth radius in kilometers

    dlat_rad    = (destination.latitude-source.latitude) * rad_per_deg # Delta, converted to rad
    dlon_rad    = (destination.longtitude-source.longtitude) * rad_per_deg

    lat1_rad    = source.latitude * rad_per_deg
    lat2_rad    = destination.latitude * rad_per_deg

    a           = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c           = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    rkm * c  # Delta in Kilometers
  end
end
