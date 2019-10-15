class RepairOrder < ApplicationRecord
    belongs_to :employee
    belongs_to :vehicle
    belongs_to :customer
    has_many :jobs

    validates :vehicle_id, :customer_id, :employee_id, presence: true

end
