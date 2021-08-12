class JobToolsController < ApplicationController

    def new
        @job_tool = JobTool.new
    end

    def create
        @job = JobTool.create(job_tool_params)
        tool = Tool.find_or_create_by(title: params["job_tool"]["tool"]["title"])
        @job.tool_id = tool.id
        @job.job_id = params[:job_id]
        @job.update(job_tool_params)
        job = @job_tool.job
        
        @job_tool.save
        redirect_to job_path(job)
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
