class ApiController < ApplicationController
    def get_all_books
      @books = Book.all
      if @books.any?
        render json: { data: @books, code: 200 }, status: :ok
      else
        render json: { error: "Tidak ada buku yang ditemukan.", code: 404 }, status: :not_found
      end
    end
  
    def get_book_by_id
      begin
        @book = Book.find(params[:id])
        render json: { data: @book, code: 200 }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Buku tidak ditemukan.", code: 404 }, status: :not_found
      end
    end
  end