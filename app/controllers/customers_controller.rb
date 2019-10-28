class CustomersController < ApplicationController
    before_action :authenticate, except: [:new, :create]
    
    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            log_in(@customer)
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

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            redirect_to customer_path(@customer)
        else
            render :edit
        end
    end

    def destroy
        if @customer = Customer.find(params[:id])
          @customer.destroy
          redirect_to customers_path
        end
    end

    private

    def customer_params
        params.require(:customer).permit(:name, :phone_number, :email, :password, :password_confirmation)
    end

end
