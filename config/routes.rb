Rails.application.routes.draw do
  get 'book_collection/home'
  get 'book_collection/add'
  get 'book_collection/update'
  get 'book_collection/details'
  get 'book_collection/delete'
  get 'test/index'
  get 'test/keerat'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
