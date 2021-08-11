class JobsController < ApplicationController
    before_action :redirect

    def new
        @job = Job.new
    end

    def create
        @job = current_user.jobs.build(job_params)
        if @job.save
            redirect_to jobs_path
        else
            render :new
        end
    end

    def index
        @jobs = Job.all
    end

    def show
        @job = Job.find_by_id(params[:id])
    end


    private

    def job_params
        params.require(:job).permit(:title, :content)
    end
end
