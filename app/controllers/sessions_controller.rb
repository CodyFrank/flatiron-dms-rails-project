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

end
