class User < ApplicationRecord
    has_many :repair_orders
    has_may :vehicles, through: :repair_orders
end
