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
        session[:user_type] = user.class
        session[:user_id] = user.id
        flash[:success] = "Welcome #{user.name}"
    end

    def current_user
        if session[:user_type] == Employee
            emp = Employee.find_by(id: session[:user_id])
            return emp
        elsif session[:user_type] == Customer
            cust = Customer.find_by(id: session[:user_id])
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
end