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

    def facebook_create
        @customer = Customer.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
        end
     
        session[:user_id] = @customer.id
     
        redirect_to customer_path(@customer)
      end

    private

    def auth
        request.env['omniauth.auth']
      end

end
