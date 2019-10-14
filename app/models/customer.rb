class Customer < ApplicationRecord
    has_many :repair_orders
    has_many :vehicles, through: :repair_orders
    has_many :jobs, through: :repair_orders
end
