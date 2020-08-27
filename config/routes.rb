Rails.application.routes.draw do
  # get 'books/index'
  # get 'books/show'
  # get 'books/new'
  # get 'books/edit'
  root "books#index"


  resources :books do
    resources :reviews
  end
end
