class JobsController < ApplicationController
    before_action :redirect

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(job_params)
        if @job.save
            redirect_to jobs_path
        else
            render :new
        end
    end


    private

    def job_params
        params.require(:job).permit(:title, :content)
    end
end
