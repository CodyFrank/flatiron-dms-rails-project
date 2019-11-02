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
        if user.class == Employee
            session[:user_id] = "1#{user.id}"
        else
            session[:user_id] = "2#{user.id}"
        end
        flash[:success] = "Welcome #{user.name}"
    end

    def current_user
        if session[:user_id]
            if session[:user_id].starts_with?("1")
                Employee.find_by(id: session[:user_id][1..2])
            elsif session[:user_id].starts_with?("2")
                Customer.find_by(id: session[:user_id][1..2])
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
end