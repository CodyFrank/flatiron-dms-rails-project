class SessionsController < ApplicationController

    def new
        @employee = Employee.new
    end

    def create
    end

    def destroy
        if logged_in?
          session.clear
          redirect_to login_path
        else
            redirect_to "application/home"
        end
    end
end
