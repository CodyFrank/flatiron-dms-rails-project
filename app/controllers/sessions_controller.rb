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
end
