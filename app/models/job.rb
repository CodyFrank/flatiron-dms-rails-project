class Job < ApplicationRecord
    belongs_to :repair_order
    validates :concern, presence: true
    validates_associated :repair_order
end
