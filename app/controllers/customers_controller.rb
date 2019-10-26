class CustomersController < ApplicationController

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            redirect_to customer_path(@customer)
        else
            render :new
        end
    end

    private

    def customer_params
        params.require(:customer).permit(:name, :phone_number, :email)
    end

end
