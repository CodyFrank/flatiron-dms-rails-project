class CustomersController < ApplicationController
    before_action :authenticate, except: [:new, :create]
    before_action :get_customer, except: [:new, :index, :create]
    
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
       
    end

    def edit
      
    end

    def update
        
        if @customer.update(customer_params)
            redirect_to customer_path(@customer)
        else
            render :edit
        end
    end

    def destroy
        if @customer
          @customer.destroy
          redirect_to customers_path
        end
    end

    private

    def customer_params
        params.require(:customer).permit(:name, :phone_number, :email, :password, :password_confirmation)
    end

    def get_customer
        @customer = Customer.find(params[:id])
    end

end
