class SessionsController < ApplicationController

    def new
    end

    def create
        @employee = Employee.find_by(worker_number: params[:worker_number])
        if @employee && @employee.authenticate(params[:password])
            log_in(@employee)   
        else
            flash[:failed] = "Login Failed"
            render :new
        end
    end

    def destroy
        if logged_in?
          session.clear
          redirect_to login_path
        else
            redirect_to "application/home"
        end
    end

    def googleAuth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        employee = Employee.from_omniauth(access_token)
        log_in(employee)
      end
end
