class RepairOrdersController < ApplicationController

    def new
        @repair_order = RepairOrder.new
        2.times { @repair_order.jobs.build }
    end

    def create
        @repair_order = RepairOrder.new
        veh = Vehicle.find_by(vin: repair_order_params[:vin_number])
        emp = Employee.find_by(id: session[:user_id])
        if veh
          cust = veh.customer
        end

        if @repair_order.save
            redirect_to repair_order_path(@repair_order)
        else
            render :new
        end
    end

    def index
        if params[:employee_id]
            @repair_orders = Employee.find(params[:employee_id]).repair_orders
        else
          @repair_orders = RepairOrder.all
        end
    end

    def show
        @repair_order = RepairOrder.find(params[:id])
    end

    private

    def repair_order_params
        params.require(:repair_order).permit(:vin_number, :worker_number, jobs_attributes:[
            :concern, 
            :completed
        ])

    end
end
