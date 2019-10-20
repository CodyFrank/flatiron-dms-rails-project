class RepairOrdersController < ApplicationController

    def new
        @repair_order = RepairOrder.new
    end

    def create
        @ro = RepairOrder.new
        veh = Vehicle.find_by(vin: repair_order_params[:vin_number])
        cust = Customer.find_by(email: repair_order_params[:customer_email])
        emp = Employee.find_by(worker_number: repair_order_params[:worker_number])
        if veh.customer == cust
           @ro.vehicle = veh
           @ro.customer = cust
           @ro.employee = emp
        else
            flash[:failed] = "Customer does not own this Vehicle"
            render :new
        end

        if @ro.save
            redirect_to repair_order_path(@ro)
        else
            render :new
        end
    end

    private

    def repair_order_params
        params.require(:repair_order).permit(:vin_number, :worker_number, :customer_email)

    end
end
