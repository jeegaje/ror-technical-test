class BookController < ApplicationController
    before_action :is_current_user_exist

    def index
        @books = Book.all
    end

    def new
        @book_post = Book.new
    end

    def edit
        @book_post = Book.find(params[:id])
    end

    def create
        @book_post =  Book.new({
            author: Author.find_by(id: params[:book][:author_id]),
            title: params[:book][:title],
            description: params[:book][:description],
            book_language: params[:book][:book_language],
            publication_year: params[:book][:publication_year],
            publisher: params[:book][:publisher],
            isbn: params[:book][:isbn],
            page_count: params[:book][:page_count],
            price: params[:book][:price],
            availability: params[:book][:availability],
            rating: params[:book][:rating]
        })

        if @book_post.save
            BookMailer.with(user: Current.user, book: @book_post).create.deliver_later
            redirect_to :books
        else
            render 'new', status: :unprocessable_entity
        end
    end
    def update
        @book_post = Book.find(params[:id])
        if @book_post.update({
            author: Author.find_by(id: params[:book][:author_id]),
            title: params[:book][:title],
            description: params[:book][:description],
            book_language: params[:book][:book_language],
            publication_year: params[:book][:publication_year],
            publisher: params[:book][:publisher],
            isbn: params[:book][:isbn],
            page_count: params[:book][:page_count],
            price: params[:book][:price],
            availability: params[:book][:availability],
            rating: params[:book][:rating]
        })
         
            redirect_to :book_edit
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    private

    def book_post_params
        params.require(:book).permit(
            :title,
            :description,
            :book_language,
            :publication_year,
            :publisher,
            :isbn,
            :page_count,
            :price,
            :availability,
            :rating
        )
    end
end