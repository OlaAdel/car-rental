class Make < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :models
end
