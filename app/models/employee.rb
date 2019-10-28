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
      refresh_token = auth.credentials.refresh_token
      employee = Employee.find_by(email: auth.info.email)
          employee.google_uid = auth.credentials.token
          employee.google_refresh_token = refresh_token if refresh_token.present?
          employee
    end

end
