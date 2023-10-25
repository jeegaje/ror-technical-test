# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds/authors.rb

Author.destroy_all

authors_data = [
  {
    first_name: "Pete",
    last_name: "Docter",
    nationality: "American",
    email: "pete@example.com",
    birth_date: DateTime.parse("2013-10-07 08:23:19.120")
  },
  {
    first_name: "John",
    last_name: "Smith",
    nationality: "British",
    email: "john@example.com",
    birth_date: DateTime.parse("2015-08-15 10:30:45.250")
  },
  {
    first_name: "Emily",
    last_name: "Jones",
    nationality: "Canadian",
    email: "emily@example.com",
    birth_date: DateTime.parse("2010-12-25 16:45:30.500")
  }
]

authors_data.each do |author_data|
  Author.create!(author_data)
end

puts "Created #{Author.count} Authors"

# db/seeds/books.rb

Book.destroy_all

books_data = [
  {
    author: Author.find_by(last_name: "Docter"),
    title: "Physics",
    description: "A.",
    book_language: "English",
    publication_year: 2021,
    publisher: "Science Publishers",
    isbn: "978-1234567890",
    page_count: 300,
    price: 25,
    availability: true,
    rating: 4
  },
  {
    author: Author.find_by(last_name: "Docter"),
    title: "Biology",
    description: "B.",
    book_language: "English",
    publication_year: 2019,
    publisher: "Life Sciences Press",
    isbn: "978-0987654321",
    page_count: 250,
    price: 20,
    availability: true,
    rating: 4
  },
  {
    author: Author.find_by(last_name: "Smith"),
    title: "History",
    description: "C.",
    book_language: "English",
    publication_year: 2020,
    publisher: "History Books Ltd",
    isbn: "978-9876543210",
    page_count: 350,
    price: 30,
    availability: true,
    rating: 3
  }
]

books_data.each do |book_data|
  Book.create!(book_data)
end

puts "Created #{Book.count} Books"
