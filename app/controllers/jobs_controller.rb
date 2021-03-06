class JobsController < ApplicationController

    before_action :check_logged_in
    before_action :check_employee


    def new
        if params[:repair_order_id]
          @repair_order = RepairOrder.find(params[:repair_order_id])
          @job = @repair_order.jobs.new
        else
          @job = Job.new
        end
    end

    def create  
        if job_params[:repair_order_id] && @repair_order = RepairOrder.find(job_params[:repair_order_id])
            @job = @repair_order.jobs.build(job_params)
            if @job.save
                redirect_to repair_order_path(@job.repair_order)
            end
        else
            render :new
        end
    end

    def edit
        @job = Job.find_by(id: params[:id])
    end

    def update
        if job_params[:repair_order_id] && @repair_order = RepairOrder.find(job_params[:repair_order_id])
            if @job = Job.find(params[:id])
                @job.update(job_params)
                redirect_to repair_order_path(@job.repair_order)
            end
        else
            render :edit
        end
    end

    def destroy
        @job = Job.find(params[:id]).destroy
    end

    private

    def job_params
        params.require(:job).permit(:concern, :completed, :repair_order_id)
    end


end
