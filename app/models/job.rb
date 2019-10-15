class Job < ApplicationRecord
    belongs_to :repair_order
    validates :concern, :repair_order_id, presence: true
end
