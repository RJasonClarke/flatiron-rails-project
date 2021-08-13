class JobToolsController < ApplicationController

    def new
        job = Job.find(params[:job_id])
        @user = current_user
        if current_user.id == @user.id
            @job_tool = JobTool.new
            @job_tool.job_id = params[:job_id]
        end
    end

    def create
        @job_tool = JobTool.create(job_tool_params)
        binding.pry
        tool = Tool.find_or_create_by(title: params["job_tool"]["tool"]["title"])
        @job_tool.tool_id = tool.id
        @job_tool.job_id = params[:job_id]
        @job_tool.update(job_tool_params)
        job = @job_tool.job
        
        if @job_tool.save
        redirect_to jobs_path
        end
    end

    private

    def job_tool_params
        params.require(:job_tool).permit(:job_id, :tool_id, :tool)
    end

    def tool_params
        params.require(:tools).permit(params[:projects_tool][:tools][:name])
    end
end
