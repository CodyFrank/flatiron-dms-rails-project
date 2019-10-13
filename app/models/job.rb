class Job < ApplicationRecord
    belongs_to :repair_order
    has_may :vehicles, through: :repair_orders
end
