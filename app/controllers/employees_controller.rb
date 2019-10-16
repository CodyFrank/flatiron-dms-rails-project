class EmployeesController < ApplicationController

    def new
        @employee = Employee.new
    end

    def create
        byebug
    end

end
