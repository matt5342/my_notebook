class PagesController < ApplicationController

    def index
        # which chapter? 
        @pages = current_user.notebook.chapters.pages 
        render json: @pages
    end


    def create
        @page = Page.new(page_params)
        current_chapter = Chapter.all.find(params["id"])
        @page.chapter = current_chapter
        if current_chapter.pages.last
            # debugger
            @page.number = current_chapter.pages.last.number + 1
        else
            @page.number = 1
        end
        # @page.notebook = current_user.notebook
        @page.save
        # byebug
        
        @pages = current_user.notebook.pages 
        # @pages_with_page_count = []
        # @pages.each do |page|
        #     new_obj = {}
        #     new_obj[:id] = page.id
        #     new_obj[:title] = page.title
        #     new_obj[:notebook_id] = page.notebook_id
        #     new_obj[:page_count] = page.pages.count
        #     @pages_with_page_count.push(new_obj)
        # end
        render json: @pages
    end
    

    private

    def page_params
        params.require(:page).permit(:content)
    end

end
