class ToolsController < ApplicationController

    def show
        @tool = Tool.find(params[:id])
    end

    def index
        @tools = Tool.all
    end

    private

    def tool_params
        params.require(:tool).permit(:title)
    end

end
