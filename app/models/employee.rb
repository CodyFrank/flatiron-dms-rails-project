class Employee < ApplicationRecord
    has_many :repair_orders
    has_many :vehicles, through: :repair_orders
    has_many :jobs, through: :repair_orders
    has_many :customers, through: :repair_orders
    
    has_secure_password

    validates :name, :worker_number, :job_title, presence: true
    validates :worker_number, uniqueness: true
    validates :password, confirmation: true
    validates :password_confirmation, presence: true, on: :create
    validates :worker_number, length: { is: 4 }

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |emp|
          emp.name = auth.info.name
          emp.email = auth.info.email
      end
    end

end
