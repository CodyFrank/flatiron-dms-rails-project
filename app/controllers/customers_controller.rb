class CustomersController < ApplicationController

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
    end

    private

    def customer_params
        params.require(:customer).permit(:name, :phone_number, :email, :password)
    end

end
