class JobsController < ApplicationController
    before_action :redirect

    def new
        @job = Job.new
    end

    def create
        @job = current_user.jobs.build(job_params)
        if @job.save
            redirect_to job_path(@job)
        else
            flash[:message] = 'Job must have a title'
            render :new
        end
    end

    def edit
        @job = Job.find(params[:id])
    end

    def update
        @job = Job.find(params[:id])
        @job.update(job_params)
        redirect_to job_path
    end

    def destroy
        @job = Job.find(params[:id])
        @job.tools.each do |t|
            t.destroy
        end
        @job.destroy
        redirect_to jobs_path
    end

    def index
        @jobs = Job.alpha.all
    end

    def show
        @job = Job.find_by_id(params[:id])
    end


    private

    def job_params
        params.require(:job).permit(:title, :content)
    end
end
