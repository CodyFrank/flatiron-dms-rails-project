class EmployeesController < ApplicationController

    def new
        @employee = Employee.new
    end

    def create
        byebug
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :worker_number, :job_title, :password, :password_comfirmation)
    end

end
