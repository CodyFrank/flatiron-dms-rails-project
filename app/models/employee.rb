class Employee < ApplicationRecord
    has_many :repair_orders
    has_many :vehicles, through: :repair_orders
    has_many :jobs, through: :repair_orders
    has_many :customers, through: :repair_orders
    
    has_secure_password

    validates :name, :worker_id, :job_title, presence: true
    validates :worker_id, uniqueness: true
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
    validates :worker_id, length: { is: 4 }
end
