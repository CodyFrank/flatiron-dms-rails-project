class Vehicle < ApplicationRecord
    belongs_to :customer
    has_many :repair_orders
    has_many :employees, through: :repair_orders
    has_many :jobs, through: :repair_orders
end
