class Customer < ApplicationRecord
    has_many :repair_orders
    has_many :vehicles, dependent: :destroy
    has_many :jobs, through: :repair_orders
    has_many :employees, through: :repair_orders

    has_secure_password


    validates :name, presence: true
    validates :email, :phone_number, uniqueness: true, allow_blank: true
    validates :phone_number, length: {is: 10}, allow_blank: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password_confirmation, presence: true, on: :create
end
