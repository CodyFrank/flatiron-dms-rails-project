class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user

    def home
    end

    private


    def logged_in?
        !! current_user
    end

    def employee_user
        current.find_by(id: sessions[:user_id])
    end
end