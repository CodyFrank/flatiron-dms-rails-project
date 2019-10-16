class Customer < ApplicationRecord
    has_many :repair_orders
    has_many :vehicles
    has_many :jobs, through: :repair_orders
    has_many :employees, through: :repair_orders

    has_secure_password

    validates :name, presence: true
    validates :email, :phone_number, uniqueness: true
    validates :phone_number, length: {is: 10}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
    
end
