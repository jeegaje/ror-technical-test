class AuthorController < ApplicationController
    def index 
        @authors = Author.all

        @total_page_author = (Author.all.count / 10.to_f).ceil

        if params[:page].present?
            offset_author = ((params[:page].to_i - 1) * 10)
            @authors = @authors.offset(offset_author).limit(10)
        else 
            @authors = @authors.limit(10)
        end
    end
end
