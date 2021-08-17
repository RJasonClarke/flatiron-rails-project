class JobToolsController < ApplicationController
    before_action :logged_in?

    def new
        job = Job.find(params[:job_id])
        @user = current_user
        if current_user.id == @user.id
            @job_tool = JobTool.new
            @job_tool.job_id = params[:job_id]

            render 'job_tools/new'
        else
            redirect_to user_path(@user)
            flash.alert = "You can only add tools to your own projects"
        end
    end

    def create
        @job_tool = JobTool.create(job_tool_params)
        tool = Tool.find_or_create_by(title: params["job_tool"]["tool"]["title"])
        @job_tool.tool_id = tool.id
        @job_tool.job_id = params[:job_id]
        @job_tool.update(job_tool_params)
        job = @job_tool.job
        
        if @job_tool.save
        redirect_to jobs_path
        end
    end

    def show
        @job_tool = JobTool.find(params[:id])
        @user = @job_tool.job.user
    end

    private

    def job_tool_params
        params.require(:job_tool).permit(:job_id, :tool_id, :tool)
    end

    def tool_params
        params.require(:tools).permit(params[:job_tool][:tools][:title])
    end
end
