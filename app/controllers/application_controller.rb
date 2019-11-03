class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user

    def home
    end

    private


    def logged_in?
        !!current_user
    end

    def log_in(user)
        class_string = user.class.to_s
        if class_string == "Employee"
            session[:user_type] = "e"
            session[:user_id] = user.id
        else
            session[:user_type] = "c"
            session[:user_id] = user.id
        end
        flash[:success] = "Welcome #{user.name}"
    end 

    def current_user
        if session[:user_id]
            if session[:user_type] == "e"
                Employee.find_by(id: session[:user_id])
            elsif session[:user_type] == "c"
                Customer.find_by(id: session[:user_id])
            else
                nil
            end
        end
    end

    def check_logged_in
        redirect_to root_path if !logged_in?
    end

    def check_employee
        if current_user.worker_number == nil
            flash[:error] = "You must be an employee to do that"
            redirect_to customer_path(current_user)
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

    def get_customer
        if @customer = Customer.find_by(id: params[:id])
           return @customer
        else
           flash[:errors] = "That customer does not exist"
           redirect_to customers_path
        end
     end
     
end