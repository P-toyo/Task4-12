Rails.application.routes.draw do
  get '/' => 'homes#top'
  get 'books' => 'books#new'
  post 'books' => 'books#create'
  post 'books/edit'
  get 'books/:id' => 'books#show', as: "show_link"
end
