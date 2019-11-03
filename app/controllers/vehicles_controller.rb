class VehiclesController < ApplicationController
    before_action :check_logged_in
    before_action :check_employee, except: [:new, :create]

    def new
        if params[:customer_id]
            @customer = Customer.find_by(id: params[:customer_id])
            @veh = @customer.vehicles.new
        else
            redirect_to customer_path(@customer)
        end
    end

    def create
        if vehicle_params[:customer_id] && @customer = Customer.find_by(id: vehicle_params[:customer_id])
            @veh = @customer.vehicles.build(vehicle_params)
            if @veh.save
              redirect_to customer_path(@customer)
            else 
              render :new
            end
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
        params.require(:vehicle).permit(:make, :model, :miles, :vin, :customer_id)
    end

    def cust_params
        params.require(:vehicle).permit(:phone_number)
    end

end
