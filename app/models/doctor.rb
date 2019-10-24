class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
    has_many :titles
    has_many :specialties, through: :titles
    belongs_to :city
end

