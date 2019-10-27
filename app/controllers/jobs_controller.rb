class JobsController < ApplicationController

    def new
        @job = Job.new
    end

    def create
        @job.new(job_params)
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def job_params
        params.require(:job).permit(:concern, :completed)
    end

end
