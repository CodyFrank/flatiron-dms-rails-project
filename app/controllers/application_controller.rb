class ApplicationController < ActionController::Base

    def home
    end

    private


    def logged_in?
        !!current_user
    end

    def log_in(customer)
        session[:user_id] = customer.id
        flash[:success] = "Welcome #{customer.name}"
        redirect_to customer_path(customer)
    end

    def current_user
        Customer.find_by(id: session[:user_id])
    end

    def check_logged_in
        redirect_to login_path if !logged_in?
    end

    def check_employee(user)
        if user.worker_number = nil
            flash[:error] = "You must be an employee to do that"
            redirect_to customer_path(user)
        end
    end
end