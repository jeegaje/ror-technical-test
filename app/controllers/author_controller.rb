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

    def new
        @author_post = Author.new
    end

    def create
        @author_post =  Author.new({
            first_name: params[:author][:first_name],
            last_name: params[:author][:last_name],
            email: params[:author][:email],
            nationality: params[:author][:nationality]
        })
        if @author_post.save
            redirect_to :authors
        else
            render 'new', status: :unprocessable_entity
        end
    end
end
