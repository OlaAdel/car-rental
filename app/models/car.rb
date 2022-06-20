class Car < ApplicationRecord
    validates :latitude, presence: true
    validates :longtitude, presence: true
    validates :kilometers_traveled, presence: true
    validates :images, presence:true
    belongs_to :model
    has_many :availability_dates
    has_many_attached :images
end
