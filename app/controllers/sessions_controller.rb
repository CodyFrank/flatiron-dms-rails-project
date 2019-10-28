class SessionsController < ApplicationController

    def new
    end

    def create
        @customer = Customer.find_by(email: params[:email])
        if @customer && @customer.authenticate(params[:password])
            log_in(@customer)   
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
