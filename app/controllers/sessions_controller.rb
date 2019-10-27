class SessionsController < ApplicationController

    def new
    end

    def create
        @employee = Employee.find_by(worker_number: params[:worker_number])
        if @employee && @employee.authenticate(params[:password])
            session[:user_id] = @employee.id
            flash[:success] = "Welcome #{@employee.name}"
            redirect_to employee_path(@employee)   
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
        # Access_token is used to authenticate request made from the rails application to the google server
        employee.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        employee.google_refresh_token = refresh_token if refresh_token.present?
        employee.save
        redirect_to root_path
      end
end
