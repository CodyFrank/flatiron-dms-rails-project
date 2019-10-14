class Customer < ApplicationRecord
    has_many :repair_orders
    has_many :vehicles
    has_many :jobs, through: :repair_orders
    has_many :employees, through: :repair_orders
end
