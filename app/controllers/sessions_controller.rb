class SessionsController < ApplicationController

    def new
    end

    def create
        @employee = Employee.find_by(worker_number: params[:worker_number])
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
