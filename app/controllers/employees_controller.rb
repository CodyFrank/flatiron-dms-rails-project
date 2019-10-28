class EmployeesController < ApplicationController
    
    before_action :authenticate
    before_action :get_employee, except: [:new, :create, :index]


    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def show
    end

    def index
        @employees = Employee.all
    end

    def edit

    end

    def update
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :worker_number, :job_title, :password, :password_confirmation, :admin)
    end

    def get_employee
        @employee = Employee.find(params[:id])
    end

end
