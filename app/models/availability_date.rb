class AvailabilityDate < ApplicationRecord
  validates :available_from, presence: true
  validates :available_to, presence: true
  belongs_to :car
  scope :available_after, ->(to) { where('available_to >= ?', to) }
  scope :available_before, ->(from) { where('available_from <= ?', from) }
  scope :not_reserved, -> { where(:reserved => false) }


end
