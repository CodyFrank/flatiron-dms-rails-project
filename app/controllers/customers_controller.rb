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

    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
        redirect_to customer_path
    end

    private

    def customer_params
        params.require(:customer).permit(:name, :phone_number, :email)
    end

end
