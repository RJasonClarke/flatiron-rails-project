class JobToolsController < ApplicationController

    def new
        @job_tool = JobTool.new
    end

    def create
        @job_tool = JobTool.create(job_tool_params)
        binding.pry
        @job_tool = current_user.jobs.job_tools.build(job_tool_params)
        if @job_tool.save
            redirect_to jobs_path
        end
    end

    def show

    end

    def index
        
    end

    private

    def job_tool_params
        params.require(:job_tool).permit(:job_id, :tool_id, :tool)
    end
end
