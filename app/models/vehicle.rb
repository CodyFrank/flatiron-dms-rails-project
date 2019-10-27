class Vehicle < ApplicationRecord
    belongs_to :customer
    has_many :repair_orders, dependent: :destroy
    has_many :employees, through: :repair_orders
    has_many :jobs, through: :repair_orders

    validates_associated :customer
    validates :make, :model, :miles, :vin, presence: true
    validates :vin, length: { is: 17 }
    validates :vin, uniqueness: true
end
