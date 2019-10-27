class RepairOrdersController < ApplicationController

    def new
        @repair_order = RepairOrder.new
        2.times { @repair_order.jobs.build }
    end

    def create
        @ro = RepairOrder.new
        veh = Vehicle.find_by(vin: repair_order_params[:vin_number])
        emp = Employee.find_by(id: session[:user_id])
        if veh
          cust = veh.customer
        end

        if @ro.save
            redirect_to repair_order_path(@ro)
        else
            render :new
        end
    end

    private

    def repair_order_params
        params.require(:repair_order).permit(:vin_number, :worker_number, job_attributes:[
            :concern, 
            :completed
        ])

    end
end
