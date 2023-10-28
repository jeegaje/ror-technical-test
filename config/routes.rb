Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "main#index"

  # signup
  get "signup" => "auth#signup_index"
  post "signup" => "auth#signup_create"

  # signin
  get "signin" => "auth#signin_index"
  post "signin" => "auth#signin_create"

  # logout
  delete "logout" => "auth#logout"

  get "books" => "book#index", as: :books
  get "books/create" => "book#new", as: :book_new
  post "books/create" => "book#create"
  get "books/edit/:id" => "book#edit", as: :book_edit
  patch "books/edit/:id" => "book#update"
  # Defines the root path route ("/")
  # root "posts#index"
end
