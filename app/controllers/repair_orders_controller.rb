class RepairOrdersController < ApplicationController

    def new
        @repair_order = RepairOrder.new
    end

    def create
        @repair_order = RepairOrder.new(repair_order_params)
        if @repair_order.save
            redirect_to repair_order_path
        else
            render :new
        end
    end

    private

    def repair_order_params
        params.require(:repair_order).permit(:vin_number, :worker_number, :customer_email)
    end
end
