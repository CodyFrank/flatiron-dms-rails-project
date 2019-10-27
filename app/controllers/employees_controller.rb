class EmployeesController < ApplicationController

    def repair_orders_index
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            session[:user_id] = @employee.id
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def index
        @employees = Employee.all
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :worker_number, :job_title, :password, :password_confirmation, :admin)
    end

end
