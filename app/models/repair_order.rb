class RepairOrder < ApplicationRecord
    belongs_to :employee
    belongs_to :vehicle
    belongs_to :customer
    has_many :jobs

    validates_associated :employee, :vehicle, :customer

end
