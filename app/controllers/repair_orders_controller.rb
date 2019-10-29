class RepairOrdersController < ApplicationController

    before_action :check_logged_in, except: [:index]
    before_action :check_employee, except: [:index]

    def new
        @repair_order = RepairOrder.new
        2.times { @repair_order.jobs.build }
    end

    def create
        @repair_order = RepairOrder.new
        @repair_order.vehicle = Vehicle.find_by(vin: repair_order_params[:vin_number])
        @repair_order.employee = current_user
        if @repair_order.vehicle
          @repair_order.customer = @repair_order.vehicle.customer
        end
        byebug
        if @repair_order.save
            redirect_to new_repair_order_job_path(@repair_order)
        else
            flash[:error] = "#{@repair_order.errors.full_messages}"
            render :new
        end
    end

    def index
        if params[:employee_id]
            @repair_orders = Employee.find(params[:employee_id]).repair_orders
        else
          @repair_orders = RepairOrder.incomplete
        end
    end

    def show
        @repair_order = RepairOrder.find(params[:id])
        @veh = @repair_order.vehicle
        @cust = @repair_order.vehicle.customer
        @jobs = @repair_order.jobs
    end

    def destroy
        @repair_order = RepairOrder.find(params[:id]).delete
        redirect_to repair_orders_path
    end

    private

    def repair_order_params
        params.require(:repair_order).permit(:vin_number, :worker_number, jobs_attributes:[
            :concern, 
            :completed
        ])

    end
end
