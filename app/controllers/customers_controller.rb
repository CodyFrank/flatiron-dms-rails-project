class CustomersController < ApplicationController
    before_action :check_logged_in, except: [:new, :index, :create]
    before_action :get_customer, except: [:new, :index, :create]
    before_action :invalid_customer, except: [:new, :index, :create]
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
       if @customer = Customer.find_by(id: params[:id])
          return @customer
       else
          flash[:errors] = "That customer does not exist"
          redirect_to customers_path
       end
    end

    def verify_customer?
        if current_user.worker_number == nil
            @customer == current_user
        else
            return true
        end
    end

    def invalid_customer
        if !verify_customer?
            flash[:errors] = "That is not yours!"
            redirect_to customers_path
        end
    end

end
