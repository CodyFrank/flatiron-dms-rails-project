class JobsController < ApplicationController

    before_action :authenticate 

    def new
        if params[:repair_order_id]
          @repair_order = RepairOrder.find(params[:repair_order_id])
          @job = @repair_order.jobs.build
        else
          @job = Job.new
        end
    end

    def create
        if params[:repair_order_id]
            @repair_order = RepairOrder.find(params [:repair_order_id])
            @job = @repair_order.jobs.build(jobs_params)
            if @job.save
                redirect_to repair_order_path(@job.repair_order)
            end
        else
            render :new
        end
    end

    def edit
        @job = Job.find(params[:id])
    end

    def update
        if @job.update(job_params)
            redirect_to repair_order_path(@job.repair_order)
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def job_params
        params.require(:job).permit(:concern, :completed)
    end

end
