class NotebooksController < ApplicationController

    def this_notebook
        # byebug
        if current_user.notebook
            render json: current_user.notebook
        else
            render json: {error: "no notebook yet"}
        end
    end

    def create
        # byebug
        @notebook = Notebook.new(notebook_params)
        @notebook.user = current_user
        @notebook.save

    end

    private

    def notebook_params
        params.require(:notebook).permit(:title)
    end

end
