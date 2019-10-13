class Vehicle < ApplicationRecord
    has_many :repair_orders
    has_many :users, through: :repair_orders
    has_many

end
