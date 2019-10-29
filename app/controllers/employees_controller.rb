class EmployeesController < ApplicationController
    
    before_action :check_logged_in
    before_action :check_employee
    before_action :get_employee, except: [:new, :create, :index]


    def new
        admin
        @employee = Employee.new
    end

    def create
        admin
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
        admin
    end

    def update
        admin
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def destroy
        admin
        @employee.destroy
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:name, :worker_number, :job_title, :password, :password_confirmation, :admin)
    end

    def get_employee
        if @employee = Employee.find_by(id: params[:id])
           return @employee
        else
           flash[:errors] = "That employee does not work here"
           redirect_to employees_path
        end
     end

     def admin
        if current_user.admin == nil
            redirect_to employee_path(current_user)
        end
     end

end
