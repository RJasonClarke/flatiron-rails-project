class ToolsController < ApplicationController
    before_action :redirect

    def new
        if params[:job_id] && @job = Job.find_by_id(params[:job_id])
        @tool = @job.tools.new
        end
    end

    def create
        @job = Job.find(params[:tool][:job_id])
        @tool = current_user.tools.new(tool_params)

        if @tool.save
            redirect_to job_path(@job)
        end
    end
    
    def show
        @tool = Tool.find(params[:id])
    end

    def index
        @tools = Tool.all
    end

    private

    def tool_params
        params.require(:tool).permit(:title, :job_id, :user_id)
    end

end
