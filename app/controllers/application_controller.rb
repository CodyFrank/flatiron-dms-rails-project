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
        if user.worker_number != nil
            session[:user_id] = user.worker_number
            flash[:success] = "Welcome #{user.name}"
        else
            session[:user_id] = user.id
            flash[:success] = "Welcome #{user.name}"
        end
    end

    def current_user
        if session[:user_id]
            if cust = Customer.find_by(id: session[:user_id])
                cust
            else
                Employee.find_by(worker_number: session[:user_id])
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
end