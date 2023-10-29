class BookController < ApplicationController
    before_action :authenticate_account!

    def index
        @books = Book.all
        
        @total_page = (Book.all.count / 10.to_f).ceil

        if params[:page].present?
            offset = ((params[:page].to_i - 1) * 10)
            @books = @books.offset(offset).limit(10)
        else 
            @books = @books.limit(10)
        end
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
        @notification = Notification.new({
            notification_type: 'email',
            is_sent: 0,
            metadata: {
                email: current_account.email,
                title: params[:book][:title],
            }
        })

        if @book_post.save
            if @notification.save
                NotificationJob.perform_in(5.seconds, current_account.email, @book_post.title, @book_post.publication_year, @book_post.author.first_name)
                redirect_to :books
            end
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
            redirect_to :book_edit, notice: "success update"
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