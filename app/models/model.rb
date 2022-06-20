class Model < ApplicationRecord
    validates :name, presence: true
    belongs_to :make
end
