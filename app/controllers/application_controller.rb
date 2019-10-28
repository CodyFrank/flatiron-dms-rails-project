class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user

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
end