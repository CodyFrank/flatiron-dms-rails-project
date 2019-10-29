class RepairOrder < ApplicationRecord
    belongs_to :employee
    belongs_to :vehicle
    belongs_to :customer
    has_many :jobs, dependent: :destroy

    validates_associated :employee, :vehicle, :customer

    scope :incomplete, -> { where(finished: false) }

end
