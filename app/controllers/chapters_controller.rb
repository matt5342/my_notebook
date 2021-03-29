class ChaptersController < ApplicationController
    # skip_before_action :authorized, only: [:index]
    def index
        @chapters = current_user.notebook.chapters 
        @chapters_with_page_count = []
        @chapters.each do |chapter|
            new_obj = {}
            new_obj[:id] = chapter.id
            new_obj[:title] = chapter.title
            new_obj[:notebook_id] = chapter.notebook_id
            new_obj[:page_count] = chapter.pages.count
            @chapters_with_page_count.push(new_obj)
        end
        render json: @chapters_with_page_count
    end
    def this_chapter
        # byebug
        chapter = Chapter.all.find(params["id"])
        render json: chapter.pages
    end

end
