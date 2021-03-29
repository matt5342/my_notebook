class PagesController < ApplicationController

    def index
        # which chapter? 
        @pages = current_user.notebook.chapters.pages 
        render json: @pages
    end

end
