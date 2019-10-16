class EmployeesController < ApplicationController

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            session[:user_id] = @employee.id
            redirect_to employee_path
        else
            render :new
        end
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :worker_number, :job_title, :password, :password_confirmation, :admin)
    end

end
