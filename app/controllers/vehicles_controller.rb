class VehiclesController < ApplicationController
    before_action :check_logged_in
    def new
        @veh = Vehicle.new
    end

    def create
        @veh = Vehicle.new(vehicle_params)
        @veh.customer = Customer.find_by(phone_number: cust_params[:phone_number])
        if @veh.save
          redirect_to customer_path(@veh.customer)
        else 
            render :new
        end
    end

    def index
        @vehicles = Vehicle.all
    end

    def destroy
        Vehicle.find(params[:id]).destroy
        redirect_to vehicles_path
    end

    private

    def vehicle_params
        params.require(:vehicle).permit(:make, :model, :miles, :vin)
    end

    def cust_params
        params.require(:vehicle).permit(:phone_number)
    end

end
