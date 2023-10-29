Rails.application.routes.draw do
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "main#index"

  get "books" => "book#index", as: :books
  get "books/create" => "book#new", as: :book_new
  post "books/create" => "book#create"
  get "books/edit/:id" => "book#edit", as: :book_edit
  patch "books/edit/:id" => "book#update"

  get "authors" => "author#index"


  get "api/books" => "api#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
