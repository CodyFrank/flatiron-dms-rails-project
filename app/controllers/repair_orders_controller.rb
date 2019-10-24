class RepairOrdersController < ApplicationController

    def new
        @repair_order = RepairOrder.new
    end

    def create
        byebug
        @ro = RepairOrder.new
        veh = Vehicle.find_by(vin: repair_order_params[:vin_number])
        emp = Employee.find_by(id: session[:user_id])
        byebug
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
        params.require(:repair_order).permit(:vin_number, :worker_number)

    end
end
