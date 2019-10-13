class RepairOrder < ApplicationRecord
    belongs_to :user
    belongs_to :vehicle
    has_many :jobs

end
