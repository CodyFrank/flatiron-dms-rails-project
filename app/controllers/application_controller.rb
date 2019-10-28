class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user

    def home
    end

    private


    def logged_in?
        !!current_user
    end

    def log_in(employee)
        session[:user_id] = employee.id
        flash[:success] = "Welcome #{employee.name}"
        redirect_to employee_path(employee)
    end

    def current_user
        Employee.find_by(id: session[:user_id])
    end

    def authenticate
        redirect_to login_path if !logged_in?
    end
end